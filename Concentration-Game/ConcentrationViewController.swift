//
//  ViewController.swift
//  Concentration-Game
//
//  Created by Husayn Hakeem on 1/27/18.
//  Copyright © 2018 HusaynHakeem. All rights reserved.
//

import UIKit

class ConcentrationViewController: UIViewController {
    
    private lazy var concentration = Concentration(numberOfCardPairs: (cardButtons.count + 1)/2)
    private var numberOfFlips = 0 {
        didSet {
            updateNumberOfFlips()
        }
    }
    
    private func updateNumberOfFlips() {
        let attributes: [NSAttributedStringKey:Any] = [
            .strokeColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1),
            .strokeWidth: 5
        ]
        let attributedText = NSAttributedString(string: "Flips: \(numberOfFlips)", attributes: attributes)
        numberOfFlipsLabel.attributedText = attributedText
    }

    @IBOutlet private var cardButtons: [UIButton]!
    @IBOutlet private weak var numberOfFlipsLabel: UILabel! {
        didSet {
            updateNumberOfFlips()
        }
    }
    
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.index(of: sender) {
            if !concentration.cards[cardNumber].isMatched {
                numberOfFlips += 1
                concentration.chooseCard(at: cardNumber)
                updateUI()
            }
        } else {
            print("Pressed card not found in array of buttons")
        }
    }
    
    private func updateUI() {
        if cardButtons != nil {
            for index in cardButtons.indices {
                let cardButton = cardButtons[index]
                let card = concentration.cards[index]
                
                if (card.isFaceUp) {
                    updateCardButton(for: cardButton, withEmoji: emoji(for: card), withColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
                } else {
                    updateCardButton(for: cardButton, withEmoji: "", withColor: card.isMatched ? #colorLiteral(red: 1, green: 0.1857388616, blue: 0.5733950138, alpha: 0) : #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1))
                }
            }
        }
    }
    
    private func updateCardButton(for card: UIButton, withEmoji emoji: String, withColor color: UIColor) {
        card.setTitle(emoji, for: UIControlState.normal)
        card.backgroundColor = color
    }
    
    var theme: String? {
        didSet {
            emojis = theme ?? ""
            emojiButtonDictionary = [:]
            updateUI()
        }
    }
    private var emojis = "👻🎃🦇💀😱🙀"
    private var emojiButtonDictionary = [Card:String]()
    
    private func emoji(for card: Card) -> String {
        if (emojiButtonDictionary[card] == nil) {
            let emojiIndex = emojis.index(emojis.startIndex, offsetBy: emojis.count.arc4random)
            emojiButtonDictionary[card] = String(emojis.remove(at: emojiIndex))
        }
        return emojiButtonDictionary[card] ?? "?"
    }
}


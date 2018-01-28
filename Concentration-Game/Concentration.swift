//
//  Concentration.swift
//  Concentration-Game
//
//  Created by Husayn Hakeem on 1/27/18.
//  Copyright © 2018 HusaynHakeem. All rights reserved.
//

import Foundation

class Concentration {
    
    var cards = Array<Card>()
    private var indexOfUniqueFaceUpCard: Int! {
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    init(numberOfCardPairs: Int) {
        for _ in 1...numberOfCardPairs {
            let card = Card()
            cards += [card, card]
        }
        cards.shuffle()
    }
    
    func chooseCard(at index: Int) {
        if let matchIndex = indexOfUniqueFaceUpCard, matchIndex != index {
            if (cards[matchIndex].identifier == cards[index].identifier) {
                cards[index].isMatched = true
                cards[matchIndex].isMatched = true
            }
            cards[index].isFaceUp = true
        } else {
            indexOfUniqueFaceUpCard = index
        }
    }
}

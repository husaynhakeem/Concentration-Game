//
//  Concentration.swift
//  Concentration-Game
//
//  Created by Husayn Hakeem on 1/27/18.
//  Copyright © 2018 HusaynHakeem. All rights reserved.
//

import Foundation

class Concentration {
    
    private(set) var cards = [Card]()
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
        assert(numberOfCardPairs > 0, "Concentration.init(\(numberOfCardPairs): Must have at least 1 pair of cards")
        for _ in 1...numberOfCardPairs {
            let card = Card()
            cards += [card, card]
        }
        cards.shuffle()
    }
    
    func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index): Chosen card index not contained in cards")
        if let matchIndex = indexOfUniqueFaceUpCard, matchIndex != index {
            if (cards[matchIndex] == cards[index]) {
                cards[index].isMatched = true
                cards[matchIndex].isMatched = true
            }
            cards[index].isFaceUp = true
        } else {
            indexOfUniqueFaceUpCard = index
        }
    }
}

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
    private var indexOfUniqueFaceUpCard: Int!
    
    init(numberOfCardPairs: Int) {
        for _ in 1...numberOfCardPairs {
            let card = Card()
            cards += [card, card]
        }
    }
    
    func chooseCard(at index: Int) {
        if let matchIndex = indexOfUniqueFaceUpCard, matchIndex != index {
            if (cards[matchIndex].identifier == cards[index].identifier) {
                cards[index].isMatched = true
                cards[matchIndex].isMatched = true
            }
            cards[index].isFaceUp = true
            indexOfUniqueFaceUpCard = nil
        } else if (indexOfUniqueFaceUpCard == nil) {
            for index in cards.indices {
                cards[index].isFaceUp = false
            }
            indexOfUniqueFaceUpCard = index
            cards[index].isFaceUp = true
        }
    }
}

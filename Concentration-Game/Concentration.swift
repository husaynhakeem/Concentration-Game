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
            return cards.indices.filter { cards[$0].isFaceUp }.oneAndonlyElement
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

extension Collection {
    var oneAndonlyElement: Element? {
        return count == 1 ? first : nil
    }
}








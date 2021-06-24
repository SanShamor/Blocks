//
//  ConcentrationGame.swift
//  Blocks
//
//  Created by Александр on 22.06.2021.
//

import Foundation

class ConcentrationGame {
    
    var cards = [Card]()
    
    var indexOfFaceUpCard: Int?
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchingIndex = indexOfFaceUpCard, matchingIndex != index {
                if cards[matchingIndex].identifier == cards[index].identifier {
                    cards[matchingIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFacedUp = true
                indexOfFaceUpCard = nil
            } else {
                for flipDown in cards.indices {
                    cards[flipDown].isFacedUp = false
                }
                cards[index].isFacedUp = true
                indexOfFaceUpCard = index
            }
        }
    }
    
    init(numbersOfCards: Int) {
        for _ in 1...numbersOfCards {
            let card = Card()
            cards += [card, card]
        }
    }
}

//
//  ConcentrationGame.swift
//  Blocks
//
//  Created by Александр on 22.06.2021.
//

import Foundation

class ConcentrationGame {
    
    var cards = [Card]()
    
    private var indexOfFaceUpCard: Int? {
        get {
            
            return cards.indices.filter { cards[$0].isFacedUp }.oneAndOnly
//            return faceUpCardIndices.count == 1 ? faceUpCardIndices.first : nil
            
//            var foundIndex: Int?
//            for index in cards.indices {
//                if cards[index].isFacedUp {
//                    if foundIndex == nil {
//                        foundIndex = index
//                    } else {
//                        return nil
//                    }
//                }
//            }
//            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFacedUp = (index == newValue)
            }
        }
    }
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchingIndex = indexOfFaceUpCard, matchingIndex != index {
                if cards[matchingIndex] == cards[index] {
                    cards[matchingIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFacedUp = true
            } else {
                indexOfFaceUpCard = index
            }
        }
    }
    
    init(numbersOfCards: Int) {
        assert(numbersOfCards > 0, "ConcentrationGame.init(\(numbersOfCards): must have at least one pair of cards")
        for _ in 1...numbersOfCards {
            let card = Card()
            cards += [card, card]
        }
    }
}

extension Collection {
    
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
    
}

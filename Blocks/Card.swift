//
//  Card.swift
//  Blocks
//
//  Created by Александр on 22.06.2021.
//

import Foundation

struct Card: Hashable {
    
    var isFacedUp = false
    var isMatched = false
    private var identifier: Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    private static var identifierNumber = 0
    
    private static func identifierGenerator() -> Int {
        identifierNumber += 1
        return identifierNumber
    }
    
    init() {
        self.identifier = Card.identifierGenerator()
    }
    
}

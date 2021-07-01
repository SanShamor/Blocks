//
//  ViewController.swift
//  Blocks
//
//  Created by Александр on 22.06.2021.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var game = ConcentrationGame(numbersOfCards: numberOfPairsOfCards)
    
    private var emojiCollection = ["👽", "👻", "🎃", "🤡", "👾", "☠️", "🤮", "🤢", "💩", "🥶"]
    private var emojiDictionary = [Card:String]()
    
    private var numberOfPairsOfCards: Int {
        return (buttonCollection.count + 1) / 2
    }
    
    private(set) var touches = 0 {
        didSet{
            touchLabel.text = "Touches: \(touches)"
        }
    }
    
    @IBOutlet var buttonCollection: [UIButton]!
    
    @IBOutlet weak var touchLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func emojiIdentifier(for card: Card) -> String {
        if emojiDictionary[card] == nil {
            emojiDictionary[card] = emojiCollection.remove(at: emojiCollection.count.arc4randomExtension)
        }
        return emojiDictionary[card] ?? "?"
    }
    
    private func updateViewFromModel() {
        for index in buttonCollection.indices {
            let button = buttonCollection[index]
            let card = game.cards[index]
            if card.isFacedUp {
                button.setTitle(emojiIdentifier(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 0, green: 0.468845427, blue: 1, alpha: 1)
            }
        }
    }
    
    @IBAction func buttonAcftion(_ sender: UIButton) {
        touches += 1
        if let buttonIndex = buttonCollection.firstIndex(of: sender) {
            game.chooseCard(at: buttonIndex)
            updateViewFromModel()
        }
    }
    
}

extension Int {
    var arc4randomExtension: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
    
}

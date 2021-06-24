//
//  ViewController.swift
//  Blocks
//
//  Created by Александр on 22.06.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var emojiCollection = ["👽", "👻", "🎃", "🤡", "👾", "☠️", "🤮", "🤢", "💩", "🥶"]
    var emojiDictionary = [Int:String]()
    
    lazy var game = ConcentrationGame(numbersOfCards: buttonCollection.count)
    
    var touches = 0 {
        didSet{
            touchLabel.text = "Touches: \(touches)"
        }
    }
    
    @IBOutlet var buttonCollection: [UIButton]!
    
    @IBOutlet weak var touchLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func emojiIdentifier(for card: Card) -> String {
        if emojiDictionary[card.identifier] == nil {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiCollection.count)))
            emojiDictionary[card.identifier] = emojiCollection.remove(at: randomIndex)
        }
        return emojiDictionary[card.identifier] ?? "?"
    }
    
    func updateViewFromModel() {
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


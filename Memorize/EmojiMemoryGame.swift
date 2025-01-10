// VIEWMODEL

import SwiftUI

func createCardContent(forPairAtIndex index: Int) -> String {
    return ["👻", "🎃", "🕷️", "😈","💀","🕸️","🧙‍♀️","🙀", "👹", "😱", "☠️", "🍭"][index]
}

class EmojiMemoryGame {
    private var model: MemoryGame<String> = MemoryGame<String>(
        numberOfPairsOfCards: 4,
        cardContentFactory: { (index: Int) -> String in
            return ["👻", "🎃", "🕷️", "😈","💀","🕸️","🧙‍♀️","🙀", "👹", "😱", "☠️", "🍭"][index]
        }
    )
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}

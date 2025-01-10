// VIEWMODEL

import SwiftUI

func createCardContent(forPairAtIndex index: Int) -> String {
    return ["👻", "🎃", "🕷️", "😈","💀","🕸️","🧙‍♀️","🙀", "👹", "😱", "☠️", "🍭"][index]
}

class EmojiMemoryGame {
    private var model = MemoryGame(numberOfPairsOfCards: 4) { index in
        return ["👻", "🎃", "🕷️", "😈","💀","🕸️","🧙‍♀️","🙀", "👹", "😱", "☠️", "🍭"][index]
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}

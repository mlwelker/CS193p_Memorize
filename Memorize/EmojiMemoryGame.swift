// VIEWMODEL

import SwiftUI


class EmojiMemoryGame {
    private static let emojis: [String] = ["👻", "🎃", "🕷️", "😈","💀","🕸️","🧙‍♀️","🙀", "👹", "😱", "☠️", "🍭"]
    
    private var model = createMemoryGame()
    
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame(numberOfPairsOfCards: 4) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}

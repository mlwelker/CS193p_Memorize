// VIEWMODEL

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    private static let emojis: [String] = ["👻", "🎃", "🕷️", "😈","💀","🕸️","🧙‍♀️","🙀", "👹", "😱", "☠️", "🍭"]
    
    private static let animalsTheme = CardTheme(
        name: "Animals",
        color: .purple,
        emojis: ["🐈", "🐕", "🐿️", "🦔", "🦝", "🐖", "🐍", "🦎", "🐝", "🐅", "🐘"],
        imageName: "placeholdertext.fill",
        numberOfPairs: 10
    )
    
    private static let animalFacesTheme = CardTheme(
        name: "Animal Faces",
        color: .red,
        emojis: ["🐸", "🐱", "🐶", "🐰", "🐹", "🐻", "🐨", "🦊", "🐷", "🐯"],
        imageName: "placeholdertext.fill",
        numberOfPairs: 10
    )
    
    private static let faceTheme = CardTheme(
        name: "Faces",
        color: .green,
        emojis: ["🥳", "😵‍💫", "😈", "😎", "😅", "🙀", "😱", "😇", "😍"],
        imageName: "face.smiling.inverse",
        numberOfPairs: 8
    )
    
    private static let foodTheme = CardTheme(
        name: "Food",
        color: .yellow,
        emojis: ["🍕", "🍔", "🌭", "🌮", "🌯", "🥙", "🥗", "🥪", "🍱", "🍝", "🍛", "🍿"],
        imageName: "food.circle.fill",
        numberOfPairs: 12
    )
    
    private static let halloweenTheme = CardTheme(
        name: "Halloween",
        color: .orange,
        emojis: ["👻", "🎃", "🕷️", "😈", "💀", "🕸️", "🧙‍♀️", "🙀", "👹", "😱", "☠️", "🍭"],
        imageName: "theatermasks.circle.fill",
        numberOfPairs: 4
    )
    
    private static let vehicleTheme = CardTheme(
        name: "Vehicles",
        color: .blue,
        emojis: ["🚗", "🚙", "🚛", "🚞","✈️","🚋","🚕", "🚓", "🏍️", "🛵", "🚲"],
        imageName: "car.circle.fill",
        numberOfPairs: 10
    )
    
    private static func createMemoryGame(_ theme: CardTheme) -> MemoryGame<String> {
        MemoryGame(numberOfPairsOfCards: theme.numberOfPairs) { pairIndex in
            if theme.emojis.indices.contains(pairIndex) {
                return theme.emojis[pairIndex]
            } else {
                return "⁉️"
            }
        }
    }
    
    private static let themes: [CardTheme] = [
        EmojiMemoryGame.animalsTheme,
        EmojiMemoryGame.animalFacesTheme,
        EmojiMemoryGame.faceTheme,
        EmojiMemoryGame.foodTheme,
        EmojiMemoryGame.halloweenTheme,
        EmojiMemoryGame.vehicleTheme
    ]
    
    @Published private var model = createMemoryGame(themes[0])
    @Published private(set) var theme: CardTheme = themes[0]
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intents
    
    func newGame() {
        if let randomTheme = EmojiMemoryGame.themes.randomElement() {
            model = EmojiMemoryGame.createMemoryGame(randomTheme)
            theme = randomTheme
            shuffle()
        }
    }
    
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}

struct CardTheme {
    let name: String
    let color: Color
    let emojis: Array<String>
    let imageName: String
    let numberOfPairs: Int
}

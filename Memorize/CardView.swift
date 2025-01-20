

import SwiftUI

struct CardView: View {
    typealias Card = MemoryGame<String>.Card
    
    let card: Card
    
    init(_ card: Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack {
            let base: RoundedRectangle = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            base.fill().opacity(card.isFaceUp ? 0 : 1)
        }
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
}

#Preview {
    // Why does this typealias make #Preview not work?
//    typealias Card = MemoryGame<String>.Card
//    typealias Card = CardView.Card
    VStack {
        HStack {
            CardView(MemoryGame<String>.Card(isFaceUp: true, content: "X", id: "test-1"))
            CardView(MemoryGame<String>.Card(content: "X", id: "test-1"))
        }
        HStack {
            CardView(MemoryGame<String>.Card(isFaceUp: true, isMatched: true, content: "This is a very long string that will wrap.", id: "test-1"))
            CardView(MemoryGame<String>.Card(isMatched: true, content: "X", id: "test-1"))
        }
    }
        .padding()
        .foregroundStyle(.green.secondary)
}

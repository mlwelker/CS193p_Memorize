//
//  ContentView.swift
//  Memorize
//
//  Created by Michael Welker on 1/8/25.
//

import SwiftUI

struct ContentView: View {
    let emojis: Array<String> = ["👻", "🎃", "🕷️", "😈","💀","🕸️","🧙‍♀️","🙀", "👹", "😱", "☠️", "🍭"]
    
    var cardCount: Int = 4
    
    var body: some View {
        HStack {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
            }
        }
        .foregroundStyle(.orange)
        .padding()
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let base: RoundedRectangle = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content)
            } else {
                RoundedRectangle(cornerRadius: 12).fill()
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}

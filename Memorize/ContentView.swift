//
//  ContentView.swift
//  Memorize
//
//  Created by Michael Welker on 1/8/25.
//

import SwiftUI

struct ContentView: View {
    let halloweenEmojis: Array<String> = ["👻", "🎃", "🕷️", "😈", "💀", "🕸️", "🧙‍♀️", "🙀", "👹", "😱", "☠️", "🍭"]
    let faceEmojis: Array<String> = ["🥳", "😱", "😵‍💫", "😈", "😎", "😅", "🙀", "😱", "😇", "😍"]
    let vehicleEmojis: Array<String> = ["🚗", "🚙", "🚛", "🚞","✈️","🚋","🚕", "🚓", "🏍️", "🛵", "🚲"]
    
    @State var cardCount: Int = 12
    @State var emojis: Array<String> = ["X", "X", "X", "X", "X", "X", "X", "X", "X", "X", "X", "X"]
    
    var body: some View {
        VStack{
            Text("Memorize!")
                .font(.largeTitle)
                .foregroundStyle(.orange)
            ScrollView {
                cards
            }
            Spacer()
            cardThemeSelectors
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))]) {
            ForEach(0..<emojis.count, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundStyle(.orange)
    }
    
    var cardThemeSelectors: some View {
        HStack {
            Spacer()
            Button(action: { emojis = halloweenEmojis }, label: { Text("Halloween") })
            Spacer()
            Button(action: { emojis = vehicleEmojis }, label: { Text("Vehicles") })
            Spacer()
            Button(action: { emojis = faceEmojis }, label: { Text("Faces") })
            Spacer()
        }
    }
    
    var cardCountAdjusters: some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
            
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardAdder: some View {
        cardCountAdjuster(by: 1, symbol: "rectangle.stack.badge.plus.fill")
    }
    
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let base: RoundedRectangle = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content)
                    .font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}

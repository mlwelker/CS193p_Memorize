//
//  ContentView.swift
//  Memorize
//
//  Created by Michael Welker on 1/8/25.
//

import SwiftUI

struct ContentView: View {
    let halloweenEmojis: Array<String> = ["👻", "🎃", "🕷️", "😈", "💀", "🕸️", "🧙‍♀️", "🙀", "👹", "😱", "☠️", "🍭"]
    let faceEmojis: Array<String> = ["🥳", "😵‍💫", "😈", "😎", "😅", "🙀", "😱", "😇", "😍"]
    let vehicleEmojis: Array<String> = ["🚗", "🚙", "🚛", "🚞","✈️","🚋","🚕", "🚓", "🏍️", "🛵", "🚲"]
    
    @State var cardCount: Int = 12
    @State var emojis: Array<String> = []
    @State var activeTheme: String = ""
    
    var body: some View {
        VStack{
            Text("Memorize!")
                .font(.largeTitle)
                .foregroundStyle(.orange)
            if emojis.isEmpty {
                Spacer()
                Text("↓ Select a theme ↓")
                    .foregroundStyle(.orange)
            } else {
                ScrollView {
                    cards
                }
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
            }
        }
        .foregroundStyle(.orange)
    }
    
    var cardThemeSelectors: some View {
        HStack {
            Spacer()
            cardThemeSelectorButton(themeName: "Halloween", themeImage: "theatermasks.circle.fill", arrayToUse: halloweenEmojis)
            Spacer()
            cardThemeSelectorButton(themeName: "Vehicles", themeImage: "car.circle.fill" , arrayToUse: vehicleEmojis)
            Spacer()
            cardThemeSelectorButton(themeName: "Faces", themeImage: "face.smiling.inverse", arrayToUse: faceEmojis)
            Spacer()
        }
    }
    
    func cardThemeSelectorButton(themeName: String, themeImage: String, arrayToUse: Array<String>) -> some View {
        Button(action: {
            if activeTheme != themeName {
                emojis = doubleAndShuffle(array: arrayToUse)
                activeTheme = themeName
            } else {
                emojis = []
                activeTheme = ""
            }
        }, label: {
            VStack {
                Image(systemName: themeImage)
                    .font(.title)
                Text(themeName)
            }
        })
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
    
    func doubleAndShuffle(array: Array<String>) -> Array<String> {
        var arrayToDouble = array
        arrayToDouble.append(contentsOf: array)
        return arrayToDouble.shuffled()
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

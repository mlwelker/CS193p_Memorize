//
//  ContentView.swift
//  Memorize
//
//  Created by Michael Welker on 1/8/25.
//

import SwiftUI

struct ContentView: View {
    let halloweenTheme: CardTheme = CardTheme(name: "Halloween", color: .orange, emojis: ["👻", "🎃", "🕷️", "😈", "💀", "🕸️", "🧙‍♀️", "🙀", "👹", "😱", "☠️", "🍭"], imageName: "theatermasks.circle.fill")
    let faceTheme: CardTheme = CardTheme(name: "Faces", color: .green, emojis: ["🥳", "😵‍💫", "😈", "😎", "😅", "🙀", "😱", "😇", "😍"], imageName: "face.smiling.inverse")
    let vehicleTheme: CardTheme = CardTheme(name: "Vehicles", color: .blue, emojis: ["🚗", "🚙", "🚛", "🚞","✈️","🚋","🚕", "🚓", "🏍️", "🛵", "🚲"], imageName: "car.circle.fill")
    
    @State var emojis: Array<String> = []
    @State var activeThemeName: String = ""
    @State var themeColor: Color = .gray
    
    var body: some View {
        VStack{
            Text("Memorize!")
                .font(.largeTitle)
                .foregroundStyle(themeColor)
            if emojis.isEmpty {
                Spacer()
                Text("↓ Select a theme ↓")
                    .foregroundStyle(themeColor)
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
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 60))]) {
            ForEach(0..<emojis.count, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundStyle(themeColor)
    }
    
    var cardThemeSelectors: some View {
        HStack {
            Spacer()
            cardThemeSelectorButton(theme: halloweenTheme)
            Spacer()
            cardThemeSelectorButton(theme: vehicleTheme)
            Spacer()
            cardThemeSelectorButton(theme: faceTheme)
            Spacer()
        }
    }
    
    func cardThemeSelectorButton(theme: CardTheme) -> some View {
        Button(action: {
            if activeThemeName != theme.name {
                emojis = doubleAndShuffle(array: theme.emojis)
                activeThemeName = theme.name
                themeColor = theme.color
            } else {
                emojis = []
                activeThemeName = ""
            }
        }, label: {
            VStack {
                Image(systemName: theme.imageName)
                    .font(.title)
                Text(theme.name)
                    .font(.footnote)
            }
        })
        .foregroundStyle(themeColor)
    }
    
    func doubleAndShuffle(array: Array<String>) -> Array<String> {
        var arrayToDouble = array
        arrayToDouble.append(contentsOf: array)
        return arrayToDouble.shuffled()
    }
}

struct CardView: View {
    let content: String
    
    @State var isFaceUp: Bool = false
    
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

struct CardTheme {
    let name: String
    let color: Color
    let emojis: Array<String>
    let imageName: String
}

#Preview {
    ContentView()
}

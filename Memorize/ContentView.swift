//
//  ContentView.swift
//  Memorize
//
//  Created by Michael Welker on 1/8/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView()
            CardView()
            CardView()
            CardView()
        }
        .foregroundStyle(.orange)
        .padding()
    }
}

struct CardView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .foregroundStyle(.white)
            RoundedRectangle(cornerRadius: 12)
                .strokeBorder(lineWidth: 2)
            Text("👻")
        }
    }
}

#Preview {
    ContentView()
}

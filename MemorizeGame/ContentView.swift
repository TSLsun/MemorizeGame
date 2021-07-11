//
//  ContentView.swift
//  MemorizeGame
//
//  View
//  Created by TSL on 2021/6/13.
//  (Standford CS193p Course)

import SwiftUI

struct ContentView: View {
    var emojis = ["🚓", "🚒", "🚕", "🛵", "✈️", "🚀", "🚲", "🚂", "🚑", "🚛", "🚁", "🚢", "🚌", "🚃", "🛶", "⛵️", "🚜", "🛴", "🚝", "🛸", "⛴", "🏍", "🚤", "🚡", "🛥"]
    @State var emojiCount = 6
    var body: some View {
        VStack{
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self){ emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack {
                removeButton
                Spacer()
//                Text("COUNTS")
                addButton
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
    
    var addButton: some View {
        Button {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
        }
    }
    var removeButton: some View {
        Button {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
    }
}

struct CardView: View {
    @State var isFaceUp: Bool = true
    var content: String
    
    var body: some View {
        ZStack {
            let recShape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                recShape.fill().foregroundColor(.white)
                recShape.stroke(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                recShape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(.dark)
    }
}

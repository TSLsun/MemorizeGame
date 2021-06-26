//
//  ContentView.swift
//  MemorizeGame
//
//  Created by TSL on 2021/6/13.
//  (Standford CS193p Course)

import SwiftUI

struct ContentView: View {
    var vehicles =
        ["🚓","🚒","🚕","🛵","✈️","🚀","🚲","🚂","🚑",
         "🚛","🚁","🚢","🚌","🚃","🛶","⛵️","🚜","🛴",
         "🚝","🛸","⛴","🏍","🚤","🚡","🛥"]
    var animals =
        ["🐶","🐱","🐹","🐰","🦊","🐻","🐼","🐨","🐯",
         "🦁","🐮","🐷","🐵","🐥","🐴","🦦","🦔","🐿",
         "🐘","🦒","🦘","🦆","🐫","🐊","🦧"]
    var food =
        ["🍎","🍐","🍊","🍋","🍌","🍉","🍇","🍓","🍒",
         "🍑","🍍","🥝","🍅","🥑","🍈","🍆","🥒","🌶",
         "🥕","🧀","🌽","🍔","🥦","🥐","🍗"]
    
    @State var cards: [String] = []
    @State var cardCount = 16
    
    var body: some View {
        VStack{
            Text("Memorize!").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))]) {
                    ForEach(cards, id: \.self){ card in
                        CardView(content: card)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack {
                carButton
                Spacer()
                animalButton
                Spacer()
                foodButton
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
    var carButton: some View {
        Button {
            updateCards(theme: "car")
        } label: {
            VStack {
                Image(systemName: "car")
                    .aspectRatio(/*@START_MENU_TOKEN@*/CGSize(width: 16, height: 9)/*@END_MENU_TOKEN@*/, contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                Text("Vehicles").font(.title3)
            }
        }
    }
    var animalButton: some View {
        Button {
            updateCards(theme: "animal")
        } label: {
            VStack {
                Image(systemName: "hare")
                    .aspectRatio(CGSize(width: 16, height: 9), contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                Text("Animals").font(.title3)
            }
        }
    }
    var foodButton: some View {
        Button {
            updateCards(theme: "food")
        } label: {
            VStack {
                Image(systemName: "applelogo")
                    .aspectRatio(CGSize(width: 16, height: 9), contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                Text("Food").font(.title3)
            }
        }
    }
    func updateCards(theme: String) -> Void{
        if (theme == "car") {
            cards = Array(vehicles.shuffled()[0..<cardCount])
        }
        else if (theme == "animal") {
            cards = Array(animals.shuffled()[0..<cardCount])
        }
        else if (theme == "food") {
            cards = Array(food.shuffled()[0..<cardCount])
        }
        else {
            cards = []
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
                recShape.stroke(lineWidth: 2.5)
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

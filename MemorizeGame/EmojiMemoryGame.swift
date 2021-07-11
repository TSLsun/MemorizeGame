//
//  EmojiMemoryGame.swift
//  MemorizeGame
//
//  ViewModel
//  Created by TSL on 2021/7/11.
//  (Standford CS193p Course)

import SwiftUI

class EmojiMemoryGame {
    
    static let emojis = ["🚓", "🚒", "🚕", "🛵", "✈️", "🚀", "🚲", "🚂", "🚑", "🚛", "🚁", "🚢", "🚌", "🚃", "🛶", "⛵️", "🚜", "🛴", "🚝", "🛸", "⛴", "🏍", "🚤", "🚡", "🛥"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            EmojiMemoryGame.emojis[pairIndex]
        }
    }
    
    private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
        
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
}

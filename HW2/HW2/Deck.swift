//
//  Deck.swift
//  HW2
//
//  Created by Huibo Li on 2/26/15.
//  Copyright (c) 2015 Huibo Li. All rights reserved.
//

import Foundation

class Deck {
    
    var cards:[Card]
    
    var allRank:[String]=["Ace","2","3","4","5","6","7","8","9","10","Jack","Queen","King"]
    var allSuite:[String]=["♠","♥","♣","♦"]
    
    
    init( ){
        cards = []
        for rank in allRank{
            for suite in allSuite{
                cards.append(Card(rank: rank,suite: suite))
            }
        }
    }
    
    func Shuffle(){
        var num : Int
        for var i=cards.count-1;i>0;i--
        {
            num=Int(arc4random_uniform(UInt32(i)))
            var helper=cards[i]
            cards[i]=cards[num]
            cards[num]=helper
        }
    }
    
    func DeckPrint(){
        for card in cards{
            println(card.rank+" "+card.suite)
        }
    }
}
//
//  Shoe.swift
//  HW2
//
//  Created by Huibo Li on 2/26/15.
//  Copyright (c) 2015 Huibo Li. All rights reserved.
//

import Foundation


class Shoe {
    
    var numberOfDecks:Int
    var cards:[Card] = []
    
    init(numOfDecks:Int){
        self.numberOfDecks = numOfDecks
        cards = []
        for deck in 0..<numOfDecks
        {
            var Adeck=Deck()
            cards+=Adeck.cards
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
    
    func ShoePrint()
    {
        for card in cards{
            println(card.rank+" "+card.suite)
        }
    }

}
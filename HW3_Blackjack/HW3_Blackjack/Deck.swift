//
//  Deck.swift
//  HW3
//
//  Created by Huibo Li on 3/30/15.
//  Copyright (c) 2015 Huibo Li. All rights reserved.
//

import Foundation

class Deck {
    
    var cards:[Card]
    
    var allRank:[String]=["ace","2","3","4","5","6","7","8","9","10","jack","queen","king"]
    var allSuite:[String]=["spades","diamonds","clubs","hearts"]
    
    
    init( ){
        cards = []
        for rank in allRank{
            for suite in allSuite{
                cards.append(Card(rank: rank,suite: suite))
            }
        }
    }
    
    func DeckPrint(){
        for card in cards{
            println(card.rank+" "+card.suite)
        }
    }
}
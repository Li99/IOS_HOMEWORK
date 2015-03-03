//
//  Singleton.swift
//  HW2
//
//  Created by Huibo Li on 2/28/15.
//  Copyright (c) 2015 Huibo Li. All rights reserved.
//

import Foundation


class Singleton {
    
    
    var decknum:Int=3
    var playernum:Int=2
    var agame=Game(numOfDeck: 3, numOfPlayer: 2)
    var curplayer=0
    var rounds:Int=0
    
    
    class var sharedInstance: Singleton {
        struct Static {
            static let instance: Singleton = Singleton()
        }
        return Static.instance
    }
    
}
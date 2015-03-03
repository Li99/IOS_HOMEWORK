//
//  Card.swift
//  HW2
//
//  Created by Huibo Li on 2/26/15.
//  Copyright (c) 2015 Huibo Li. All rights reserved.
//

import Foundation


class Card {
    
    var rank:String
    var suite:String
    
    init(rank:String,suite:String){
        self.rank = rank
        self.suite = suite
    }
    func Getcard()->String{
        return suite+rank
    }
    
    func value()->Int{
        switch rank{
            case "Ace":
                return 11
            case "Jack","Queen","King":
                return 10
            default:
                return rank.toInt()!
        }
        
    }
}


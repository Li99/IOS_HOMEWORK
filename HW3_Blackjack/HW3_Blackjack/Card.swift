//
//  Card.swift
//  HW3
//
//  Created by Huibo Li on 3/29/15.
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
        return rank+"_of_"+suite
    }
    
    func value()->Int{
        switch rank{
        case "ace":
            return 11
        case "jack","queen","king":
            return 10
        default:
            return rank.toInt()!
        }
        
    }
}


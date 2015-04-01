//
//  Singleton.swift
//  HW3
//
//  Created by Huibo Li on 3/30/15.
//  Copyright (c) 2015 Huibo Li. All rights reserved.
//

import Foundation


class Singleton {
    var agame=Game(name: "Game0")
    var rounds:Int=0
    var curbet:Int=1
    var count:Int=0
    var UsercardNum:Int=0
    
    func newGame(){
        count++;
        agame=Game(name:"Game\(count)");
    }
    
    class var sharedInstance: Singleton {
        struct Static {
            static let instance: Singleton = Singleton()
        }
        return Static.instance
    }
}
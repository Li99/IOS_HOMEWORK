//
//  Player.swift
//  HW2
//
//  Created by Huibo Li on 2/26/15.
//  Copyright (c) 2015 Huibo Li. All rights reserved.
//

import Foundation

class Player {
    var name:String
    var money:Int = 100
    var hands:[Hand] = []
    
    init(name:String) {
        self.name = name
    }
    
    func Getcurhand()->[String]{
        var curhand=hands.last
        var result:[String]=[]
        result=curhand!.GetHand()
        return result
    }
    
    func Getcurbet()->Int{
        var curhand=hands.last
        return curhand!.bet
    }
    
    func Getcurscore()->Int{
        var curhand=hands.last
        return curhand!.score
    }
    
    
    func StartAHand (pcard1:Card,pcard2:Card,pbet:Int){
        hands.append(Hand(card1: pcard1, card2: pcard2, bet:pbet))
    }
    
    func AddCard(card:Card){
        hands.last?.cards.append(card)
    }
    
    func Printinfo(){
        println("Name:"+name)
        for eachHand in hands{
            eachHand.Printinfo()
        }
    }
    
    
    
    
}
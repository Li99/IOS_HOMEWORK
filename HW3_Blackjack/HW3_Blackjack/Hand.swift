//
//  Hand.swift
//  HW3
//
//  Created by Huibo Li on 3/30/15.
//  Copyright (c) 2015 Huibo Li. All rights reserved.
//

import Foundation


class Hand {
    var cards:[Card]
    var bet:Int = 1
    var score:Int {
        get{
            var sum = 0
            for card in cards {
                if sum>10 && card.rank=="ace"{
                    sum++
                }
                else{
                    sum += card.value()
                }
            }
            return sum
        }
    }
    
    init(card1:Card,card2:Card,bet:Int){
        self.bet=bet
        cards = []
        cards.append(card1)
        cards.append(card2)
    }
    
    func SetBet(bet:Int){
        self.bet=bet
    }
    
    func GetHand()->[String]{
        var hand:[String]=[]
        for acard in cards{
            hand.append(acard.Getcard())
        }
        return hand
    }
    
    func Printinfo(){
        println("***********************")
        println("Score is:\(score)")
        print("Have cards:")
        for card in cards{
            print(card.suite+card.rank)
        }
        println()
        println("Current bet: \(bet)")
        println("***********************")
    }
}
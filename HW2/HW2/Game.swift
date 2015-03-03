//
//  Game.swift
//  HW2
//
//  Created by Huibo Li on 2/26/15.
//  Copyright (c) 2015 Huibo Li. All rights reserved.
//

import Foundation

class Game{
    var numOfDeck:Int
    var numOfPlayer:Int
    var dealer:Player
    var players:[Player]=[]
    var aShoe:Shoe
    
    
    
    init(numOfDeck:Int,numOfPlayer:Int){
        self.numOfDeck=numOfDeck
        self.numOfPlayer=numOfPlayer
        dealer=Player(name:"Dealer")
        aShoe=Shoe(numOfDecks: numOfDeck)
        for i in 0..<numOfPlayer{
            players.append(Player(name:"Player"+String(i)))
        }
    }
    
    func Printinfo()
    {
        println("Number of deck:\(numOfDeck)")
        println("Number of player:\(numOfPlayer)")
        for player in players
        {
            player.Printinfo()
        }
        dealer.Printinfo()
        println("The card left\(aShoe.cards.count)")
    }
    
    func Shuffle(){
        aShoe.Shuffle()
    }
    
    func FirstDeal(bet:[Int]){
       // aShoe.Shuffle()
        var i:Int=0
        for aplayer in players{
            var helper1=aShoe.cards[0]
            var helper2=aShoe.cards[1]
            aplayer.StartAHand(helper1,pcard2: helper2,pbet: bet[i])
            aShoe.cards.removeAtIndex(0)
            aShoe.cards.removeAtIndex(0)
            i++
        }
        dealer.StartAHand(aShoe.cards[0], pcard2: aShoe.cards[1], pbet: 0)
        aShoe.cards.removeAtIndex(0)
        aShoe.cards.removeAtIndex(0)
    }
    
    
    func DealACard(playnum:Int){
        var curplayer=players[playnum]
        var dealcard=aShoe.cards[0]
        curplayer.AddCard(dealcard)
        aShoe.cards.removeAtIndex(0)
    }
    
    func DealerPlay(){
        while dealer.Getcurscore()<17{
            var dealcard=aShoe.cards[0]
            dealer.AddCard(dealcard)
            aShoe.cards.removeAtIndex(0)
        }
    }
    
    
    
    func CheckWin()->[String]{
        var results:[String]=[]
        var Dealerscrore=dealer.Getcurscore()
        for aplayer in players{
            var aplayerscore=aplayer.Getcurscore()
            if aplayerscore==21{
                if aplayer.Getcurhand().count==2{
                    results.append("WIN! BLACKJACK")
                    aplayer.money=aplayer.money+2*aplayer.Getcurbet()
                }
                else{
                    results.append("WIN")
                    aplayer.money=aplayer.money+aplayer.Getcurbet()
                }
            }
            else if aplayerscore>21{
                results.append("LOST! BUST")
                aplayer.money=aplayer.money-aplayer.Getcurbet()
            }
            else{
                if Dealerscrore>21{
                    results.append("WIN")
                    aplayer.money=aplayer.money+aplayer.Getcurbet()
                }
                else if Dealerscrore<=aplayerscore{
                    results.append("WIN")
                    aplayer.money=aplayer.money+aplayer.Getcurbet()
                }
                else{
                    results.append("LOSE")
                    aplayer.money=aplayer.money-aplayer.Getcurbet()
                }
            }
        }
        return results
    }
   
}
//
//  Game.swift
//  HW3
//
//  Created by Huibo Li on 3/30/15.
//  Copyright (c) 2015 Huibo Li. All rights reserved.
//

import Foundation


import Foundation

class Game{
    var gamename:String
    var numOfDeck:Int=1
    var numOfPlayer:Int=3
    var dealer:Player
    var aiplayer:Player
    var myplayer:Player
    var aShoe:Shoe
    
    
    init(name:String){
        dealer=Player(name:"Dealer")
        aiplayer=Player(name: "AIPlayer")
        myplayer=Player(name: "MyPlayer")
        aShoe=Shoe(numOfDecks: numOfDeck)
        gamename=name
    }
    
    func Printinfo()
    {
        println("Number of deck:\(numOfDeck)")
        println("Number of player:\(numOfPlayer)")
        dealer.Printinfo()
        aiplayer.Printinfo()
        myplayer.Printinfo()
        println("The card left\(aShoe.cards.count)")
    }
    
    func Shuffle(){
        aShoe.Shuffle()
    }
    
    func FirstDeal(bet:Int){
        // aShoe.Shuffle()
        dealer.StartAHand(aShoe.cards[0], pcard2: aShoe.cards[1], pbet: 0)
        aShoe.cards.removeAtIndex(0)
        aShoe.cards.removeAtIndex(0)
        aiplayer.StartAHand(aShoe.cards[0], pcard2: aShoe.cards[1], pbet:10)
        aShoe.cards.removeAtIndex(0)
        aShoe.cards.removeAtIndex(0)
        myplayer.StartAHand(aShoe.cards[0], pcard2: aShoe.cards[1], pbet:bet)
        aShoe.cards.removeAtIndex(0)
        aShoe.cards.removeAtIndex(0)
    }
    
    
    func DealACard(player:Player)->String{
        var curplayer=player
        var dealcard=aShoe.cards[0]
        curplayer.AddCard(dealcard)
        aShoe.cards.removeAtIndex(0)
        return dealcard.Getcard()
    }
    
    func DealerPlay(){
        while dealer.Getcurscore()<17 && dealer.Getcurhand().count<5{
            dealer.AddCard(aShoe.cards[0])
            aShoe.cards.removeAtIndex(0)
        }
    }
    
    func AIplayerPlay(){
        while aiplayer.Getcurscore()<17 && aiplayer.Getcurhand().count<5{
            aiplayer.AddCard(aShoe.cards[0])
            aShoe.cards.removeAtIndex(0)
        }
    }
    
    
    func CheckWin()->[String]{
        var results:[String]=[]
        var Dealerscrore=dealer.Getcurscore()
        println("Dealerscore is:\(Dealerscrore)")
        var players:[Player]=[aiplayer,myplayer]
        for aplayer in players{
            var aplayerscore=aplayer.Getcurscore()
            println(aplayer.name+" score:\(aplayerscore)")
//            if Dealerscrore>21{
//                if aplayerscore<=21{
//                    results.append("WIN!")
//                }
//                else{
//                    results.append("LOSE!")
//                }
//                break;
//            }
            if aplayerscore==21{
                if aplayer.Getcurhand().count==2{
                    results.append("BlackJack")
                    aplayer.money=aplayer.money+2*aplayer.Getcurbet()
                }
                else{
                    results.append("WIN")
                    aplayer.money=aplayer.money+aplayer.Getcurbet()
                }
            }
            else if aplayerscore>21{
                results.append("LOSE!")
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
//
//  ViewController.swift
//  Blackjack
//
//  Created by Huibo Li on 2/16/15.
//  Copyright (c) 2015 Huibo Li. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    
    @IBOutlet var Output: UILabel!
    @IBOutlet var Output1: UILabel!
    @IBOutlet var Output2: UILabel!
    @IBOutlet var Output3: UILabel!
    @IBOutlet var Input: UITextField!
    
    
    @IBOutlet var Playercard: UILabel!
    @IBOutlet var Dealercard: UILabel!
    var PlayerScore=100
    var PlayerBet=0
    var Playtimes=0
    var Level=0
    
    var DealCardindex=0
    
    var PlayerHandValue=0
    var DealerHandValue=0
    
    var PlayerHand=[0,1]
    var DealerHand=[2,3]
    
    
    var ADeck=[("Ace","♠"),("2","♠"),("3","♠"),("4","♠"),("5","♠"),("6","♠"),("7","♠"),("8","♠"),("9","♠"),("10","♠"),("Jack","♠"),("Queen","♠"),("King","♠"),("Ace","♥"),("2","♥"),("3","♥"),("4","♥"),("5","♥"),("6","♥"),("7","♥"),("8","♥"),("9","♥"),("10","♥"),("Jack","♥"),("Queen","♥"),("King","♥"),("Ace","♦"),("2","♦"),("3","♦"),("4","♦"),("5","♦"),("6","♦"),("7","♦"),("8","♦"),("9","♦"),("10","♦"),("Jack","♦"),("Queen","♦"),("King","♦"),("Ace", "♣"),("2", "♣"),("3", "♣"),("4", "♣"),("5", "♣"),("6", "♣"),("7", "♣"),("8", "♣"),("9", "♣"),("10", "♣"),("Jack", "♣"),("Queen", "♣"),("King", "♣")]
   
    var CardValue=[
        "Ace" : 10,
        "2": 2,
        "3": 3,
        "4": 4,
        "5": 5,
        "6": 6,
        "7": 7,
        "8": 8,
        "9": 9,
        "10":10,
        "Jack":10,
        "Queen":10,
        "King":10
    ]
    
    
    func Shuffle(){
        var num : Int
        for var i=ADeck.count-1;i>0;i--
            
        {
            num=Int(arc4random_uniform(UInt32(i)))
            var helper=ADeck[i]
            ADeck[i]=ADeck[num]
            ADeck[num]=helper
        }
    }
    
    
    
    func StartGame(){
        println("---StartGame() running----")
        Output.text=nil
        Output1.text=nil
        Output2.text=nil
        Output3.text="Please Input your bet to start."
       // Output4.text=nil
        Playercard.text=nil
        Dealercard.text=nil
        DealCardindex=0
        Level=0
    }
    
    
    func PrintPlayerCards(){
        var mycards:String=""
        for var i=0; i<PlayerHand.count; ++i{
            var CardSuit=ADeck[PlayerHand[i]].1
            var CardRank=ADeck[PlayerHand[i]].0
            if i==0
            {  mycards=CardSuit+CardRank}
            else
            {
                mycards=mycards+","+CardSuit+CardRank
            }
        }
        Output.text=mycards
    }
    
    func PrintDealerCards(){
        var mycards:String=""
        for var i=0; i<DealerHand.count; ++i{
            var CardSuit=ADeck[DealerHand[i]].1
            var CardRank=ADeck[DealerHand[i]].0
            if i==0
            {  mycards=CardSuit+CardRank}
            else
            {
                mycards=mycards+","+CardSuit+CardRank
            }
        }
        Output1.text=mycards
        
    }
    
    func FirstDeal(){
        var j=DealCardindex
        PlayerHand.removeAll()
        PlayerHand.append(j)
        PlayerHand.append(j+1)
        DealerHand.removeAll()
        DealerHand.append(j+2)
        DealerHand.append(j+3)
        
        //Card1 is visible to each other
        Playercard.text="Hand of Player:"
        Dealercard.text="Hand of Dealer:"
        PrintPlayerCards()
       // var i=DealCardindex
        var CardSuit=ADeck[DealerHand[0]].1
        var CardRank=ADeck[DealerHand[0]].0
        Output1.text=CardSuit+CardRank
        
        var i:Int=PlayerHand[0]
        var PlayerValue1:Int=CardValue[ADeck[i].0]!
        var PlayerValue2:Int=CardValue[ADeck[i+1].0]!
        
        
        var DealerValue1:Int=CardValue[ADeck[i+2].0]!
        var DealerValue2:Int=CardValue[ADeck[i+3].0]!
        
        PlayerHandValue=PlayerHandValue+PlayerValue1+PlayerValue2
        DealerHandValue=DealerHandValue+DealerValue1+DealerValue2
        
        Output2.text="Your score: \(PlayerScore), Your bet:\(PlayerBet)"
        Output3.text="Input your choose:H/S"
        DealCardindex=DealCardindex+4;
        Level=1
    }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        Shuffle()
        StartGame()
    }
    
    
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    @IBAction func ButtonClick(sender: UIButton) {
        if Playtimes==5{
            Shuffle()
        }
        if Level==0  //Begin Game
        {
            println("---level==0 running----")
            var bet:Int?=Input.text.toInt()
            if (bet != nil){
                if bet>PlayerScore{
                    Output3.text="You don't have enough scores."
                }
                else
                {
                    PlayerBet=bet!
                    PlayerScore=PlayerScore-PlayerBet
                    FirstDeal()
                    Level=1
                }
            }
            else
            {
                Output3.text="Wrong Format.Input Again!"
                Level=0
            }
            
        }
        else if Level==1
        {
            
            println("---level==1 running----")
            if(Input.text=="H")
            {
                PlayerHand.append(DealCardindex)
                var Value:Int=CardValue[ADeck[DealCardindex].0]!
                PlayerHandValue=PlayerHandValue+Value
                ++DealCardindex
                PrintPlayerCards()
                if PlayerHandValue>21
                {
                    Output3.text="Sorry,you lose."
                    if PlayerScore<1
                    {
                        Output2.text="Sorry,no more scores."
                        Level=3
                    }
                    else
                    {
                        Output2.text="Input your next bet."
                        Level=0
                    }
                    return
                }
            }
            else if(Input.text=="S")
            {
                ++Playtimes
                while DealerHandValue<=17
                {
                    DealerHand.append(DealCardindex)
                    var Value:Int=CardValue[ADeck[DealCardindex].0]!
                    DealerHandValue=DealerHandValue+Value
                    println(DealerHandValue)
                    ++DealCardindex
                    PrintDealerCards()
                }
                if DealerHandValue==PlayerHandValue
                {
                    Output3.text="A Draw"
                    PlayerScore=PlayerScore+PlayerBet
                    PlayerBet=0
                }
                else if DealerHandValue>PlayerHandValue && DealerHandValue>21
                {
                    if PlayerHand.count==2 && PlayerHandValue==21
                    {
                        Output3.text="Blackjack1!You win!"
                        PlayerScore=PlayerScore+PlayerBet*3;
                        PlayerBet=0;
                    }
                    else
                    {
                        Output3.text="You Win!"
                        PlayerScore=PlayerScore+PlayerBet*2;
                        PlayerBet=0;
                    }
                }
                else
                {
                    Output3.text="Sorry, you lose."
                    PlayerBet=0;
                
                }
                
                
                
                if PlayerScore<1
                {
                    Output2.text="Sorry,no more scores."
                    Level=3
                }
                else
                {
                    Output2.text="Input your next bet."
                    Level=0
                }
                
            }
            else
            {
                Output3.text="Please input H/S."
            }
            

        }
        else
        {
            Output3.text=""
            
        }
        
    }
    
}


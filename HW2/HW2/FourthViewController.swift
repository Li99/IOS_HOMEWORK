//
//  FourthViewController.swift
//  HW2
//
//  Created by Huibo Li on 3/2/15.
//  Copyright (c) 2015 Huibo Li. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {

    @IBOutlet weak var DealerCards: UILabel!
    @IBOutlet weak var Player0Result: UILabel!
    @IBOutlet weak var Player1Result: UILabel!
    @IBOutlet weak var Player2Result: UILabel!
    @IBOutlet weak var Player3Result: UILabel!
    @IBOutlet weak var Player4Result: UILabel!
    @IBOutlet weak var Player5Result: UILabel!
    
    @IBOutlet weak var Player0Card: UILabel!
    @IBOutlet weak var Player1Card: UILabel!
    @IBOutlet weak var Player2Card: UILabel!
    @IBOutlet weak var Player3Card: UILabel!
    @IBOutlet weak var Player4Card: UILabel!
    @IBOutlet weak var Player5Card: UILabel!
    
    @IBOutlet weak var Play0Money: UILabel!
    @IBOutlet weak var Play1Money: UILabel!
    @IBOutlet weak var Play2Money: UILabel!
    @IBOutlet weak var Play3Money: UILabel!
    @IBOutlet weak var Play4Money: UILabel!
    @IBOutlet weak var Play5Money: UILabel!

    
    var myData=Singleton.sharedInstance
    
    func InitDisplay(){
        var playernum=myData.playernum
        
        
        myData.agame.DealerPlay()
        var dealer=myData.agame.dealer
        var dealerhand:String=""
        for s in dealer.Getcurhand(){
            dealerhand=dealerhand+" "+s
        }
        DealerCards.text=dealerhand
       
        var results:[String]=myData.agame.CheckWin()
        var PlayerLabels:[UILabel]=[Player0Result,Player1Result,Player2Result,Player3Result,Player4Result,Player5Result]
        var CardLabels:[UILabel]=[Player0Card,Player1Card,Player2Card,Player3Card,Player4Card,Player5Card]
        var MoneyLabels:[UILabel]=[Play0Money,Play1Money,Play2Money,Play3Money,Play4Money,Play5Money]
    
        for i in 0..<playernum{
            var curhand:String=""
            var curplayer=myData.agame.players[i]
            for s in curplayer.Getcurhand()
            {
                curhand=curhand+" "+s
            }
            PlayerLabels[i].text="Player\(i): "+results[i]+"  "
            CardLabels[i].text="Hand is "+curhand
            var money=curplayer.money
            MoneyLabels[i].text="Current money is \(money)"
        }
        for i in playernum..<6{
            PlayerLabels[i].text=" "
            CardLabels[i].text=" "
            MoneyLabels[i].text=" "
        }
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        InitDisplay()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

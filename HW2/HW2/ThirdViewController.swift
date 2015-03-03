//
//  ThirdViewController.swift
//  HW2
//
//  Created by Huibo Li on 3/1/15.
//  Copyright (c) 2015 Huibo Li. All rights reserved.
//

import UIKit





class ThirdViewController: UIViewController {

    @IBOutlet weak var CurPlayerTitle: UILabel!
    @IBOutlet weak var DealerCards: UILabel!
    
    @IBOutlet weak var PlayerMoney: UILabel!
    @IBOutlet weak var PlayerBet: UILabel!
    @IBOutlet weak var PlayerCards: UILabel!
    @IBOutlet weak var PlayerCards0: UILabel!
    
    @IBOutlet weak var NextPlayerButton: UIButton!
    @IBOutlet weak var AllFinishButton: UIButton!
    @IBOutlet weak var HitButton: UIButton!
    @IBOutlet weak var StandButton: UIButton!
   
    var myData=Singleton.sharedInstance
    
    
    func InitDisplay(){
        var playerindex=myData.curplayer
        var curplayer=myData.agame.players[playerindex]
        var curbet=curplayer.Getcurbet()
        
        CurPlayerTitle.text="Player\(playerindex) is playing"
        PlayerMoney.text="Player\(playerindex)'s Money:\(curplayer.money)"
        PlayerBet.text="Player\(playerindex)'s Bets:\(curbet)"
        PlayerCards0.text="Player\(playerindex)'s Cards:"
        
        var curhand:String=""
        for s in curplayer.Getcurhand()
        {
            curhand=curhand+" "+s
        }
        PlayerCards.text=curhand
        
        
        var dealer=myData.agame.dealer
        DealerCards.text="?? "+dealer.Getcurhand().first!
        
        NextPlayerButton.enabled=false
        AllFinishButton.enabled=false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        InitDisplay()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    @IBAction func NextPlayer(sender: AnyObject) {
        NextPlayerButton.enabled=false
        InitDisplay()
        StandButton.enabled=true
        HitButton.enabled=true
    }

    @IBAction func AllFinish(sender: AnyObject) {
        
    }
    
    @IBAction func HitChoose(sender: AnyObject) {
        
        var curplayerindex=myData.curplayer
        var playernum=myData.playernum
        var curplayer=myData.agame.players[curplayerindex]
        
        var curcardscore=curplayer.Getcurscore
        if curcardscore()>21{
            println("Exceed 21")
            HitButton.enabled=false
            StandButton.enabled=false
            let alertController = UIAlertController(title: "Busting", message: "You already lose", preferredStyle:.Alert)
            let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alertController.addAction(defaultAction)
            presentViewController(alertController, animated: true, completion: nil)
            if curplayerindex<playernum-1{
                NextPlayerButton.enabled=true
                myData.curplayer++
            }
            else{
                AllFinishButton.enabled=true
            }
        }
        else{
            myData.agame.DealACard(curplayerindex)
            
            //Display curplayer's cards
            var curhand:String=""
            for s in curplayer.Getcurhand()
            {
                curhand=curhand+" "+s
            }
            PlayerCards.text=curhand
            if curplayer.Getcurscore()>21{
                HitButton.enabled=false
                StandButton.enabled=false
                let alertController = UIAlertController(title: "Sorry", message: "You already lose", preferredStyle:.Alert)
                let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
                alertController.addAction(defaultAction)
                presentViewController(alertController, animated: true, completion: nil)
                if curplayerindex<playernum-1{
                    NextPlayerButton.enabled=true
                    myData.curplayer++
                }
                else{
                    AllFinishButton.enabled=true
                }
            }
        }
    }

    @IBAction func StandChoose(sender: AnyObject) {
        StandButton.enabled=false
        HitButton.enabled=false
        var playernum=myData.playernum
        var curplayer=myData.curplayer
        if curplayer<playernum-1{
            NextPlayerButton.enabled=true
            myData.curplayer++
        }
        else{
            AllFinishButton.enabled=true
        }
       
        
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

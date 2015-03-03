//
//  SecondViewController.swift
//  HW2
//
//  Created by Huibo Li on 3/1/15.
//  Copyright (c) 2015 Huibo Li. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var Bet0: UITextField!
    @IBOutlet weak var Bet1: UITextField!
    @IBOutlet weak var Bet2: UITextField!
    @IBOutlet weak var Bet3: UITextField!
    @IBOutlet weak var Bet4: UITextField!
    @IBOutlet weak var Bet5: UITextField!
    
    
    @IBOutlet weak var P0: UILabel!
    @IBOutlet weak var P1: UILabel!
    @IBOutlet weak var P2: UILabel!
    @IBOutlet weak var P3: UILabel!
    @IBOutlet weak var P4: UILabel!
    @IBOutlet weak var P5: UILabel!
    
    var myData = Singleton.sharedInstance
    
    func ShowPlayers(playernum:Int)
    {
        
        let Texts:[UITextField]=[Bet0,Bet1,Bet2,Bet3,Bet4,Bet5]
        let Labels:[UILabel]=[P0,P1,P2,P3,P4,P5]
        for i in 0..<playernum{
            Texts[i].text="1"
        }
        for i in playernum..<6{
            Texts[i].hidden=true
            Labels[i].hidden=true
        }
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        myData.agame.Printinfo()
        myData.curplayer=0
        let decknum=myData.decknum
        let playernum=myData.playernum
        
        ShowPlayers(playernum)
        
        
        // myData.agame=Game(numOfDeck: decknum, numOfPlayer: playernum)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func ShowAlert(type:Int)
    {
        switch type{
        case 1:
            let alertController = UIAlertController(title: "Warning", message: "Please input numbers", preferredStyle:.Alert)
            let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alertController.addAction(defaultAction)
            presentViewController(alertController, animated: true, completion: nil)
        case 2:
            let alertController = UIAlertController(title: "Warning", message: "Your bets can't less than 1", preferredStyle:.Alert)
            let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alertController.addAction(defaultAction)
            presentViewController(alertController, animated: true, completion: nil)
        case 3:
            let alertController = UIAlertController(title: "Warning", message: "You don't have enough money", preferredStyle:.Alert)
            let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alertController.addAction(defaultAction)
            presentViewController(alertController, animated: true, completion: nil)
        default:
            return
        }
    }
    
    @IBAction func SetBet(sender: AnyObject) {
        
        let Texts:[UITextField]=[Bet0,Bet1,Bet2,Bet3,Bet4,Bet5]
        let playernum=myData.playernum
        var Bets:[Int]=[]
        var type=0
        for i in 0..<playernum{
            var curplayer=myData.agame.players[i]
            var curbet=Texts[i].text.toInt()
            println("--current bet is \(curbet), player's money \(curplayer.money)")
            
            if curbet==nil{
                println("Not a number")
                type=1
                break
            }
            else if curbet<0 {
                type=2
                break
            }
            else if curbet>curplayer.money{
                type=3
                break
            }
            else
            {
                Bets.append(curbet!)
            }
        }//For loop end
        
        if type==1{
            let alertController = UIAlertController(title: "Warning", message: "Please input numbers", preferredStyle:.Alert)
            let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alertController.addAction(defaultAction)
            presentViewController(alertController, animated: true, completion: nil)
        }
        else if type==2{
            let alertController = UIAlertController(title: "Warning", message: "Your bets can't less than 1", preferredStyle:.Alert)
            let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alertController.addAction(defaultAction)
            presentViewController(alertController, animated: true, completion: nil)
        }
        else if type==3{
            let alertController = UIAlertController(title: "Warning", message: "You don't have enough money", preferredStyle:.Alert)
            let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alertController.addAction(defaultAction)
            presentViewController(alertController, animated: true, completion: nil)
        }
        else
        {
            if myData.rounds==0 || myData.rounds>=5{
                myData.agame.Shuffle()
            }
            myData.agame.FirstDeal(Bets)
            myData.agame.Printinfo()
        }
        
        //ShowAlert(type)
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

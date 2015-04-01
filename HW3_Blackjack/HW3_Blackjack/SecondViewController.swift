//
//  SecondViewController.swift
//  HW3_Blackjack
//
//  Created by Huibo Li on 3/30/15.
//  Copyright (c) 2015 Huibo Li. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var PCard1: UIImageView!
    @IBOutlet weak var PCard2: UIImageView!
    @IBOutlet weak var PCard3: UIImageView!
    @IBOutlet weak var PCard4: UIImageView!
    @IBOutlet weak var PCard5: UIImageView!
    
    
    @IBOutlet weak var ACard1: UIImageView!
    @IBOutlet weak var ACard2: UIImageView!
    @IBOutlet weak var ACard3: UIImageView!
    @IBOutlet weak var ACard4: UIImageView!
    @IBOutlet weak var ACard5: UIImageView!
    
    
    @IBOutlet weak var DCard1: UIImageView!
    @IBOutlet weak var DCard2: UIImageView!
    @IBOutlet weak var DCard3: UIImageView!
    @IBOutlet weak var DCard4: UIImageView!
    @IBOutlet weak var DCard5: UIImageView!
    
    
    @IBOutlet weak var DealerResult: UILabel!
    @IBOutlet weak var AIResult: UILabel!
    @IBOutlet weak var UserResult: UILabel!
    
    
    @IBOutlet weak var AIScore: UILabel!
    @IBOutlet weak var UserScore: UILabel!
    
    @IBOutlet weak var AIBet: UILabel!
    @IBOutlet weak var UserBet: UILabel!
    
    @IBOutlet weak var HitButton: UIButton!
    @IBOutlet weak var StandButton: UIButton!
    @IBOutlet weak var NextButton: UIButton!
    
    
    
    
    var sharedData:Singleton = Singleton.sharedInstance
    
    override func viewDidLoad() {
//        DealerResult.hidden=true
//        AIResult.hidden=true
//        UserResult.hidden=true
        
        DCard1.hidden=true
        DCard2.hidden=true
        DCard3.hidden=true
        DCard4.hidden=true
        DCard5.hidden=true
        
        ACard1.hidden=true
        ACard2.hidden=true
        ACard3.hidden=true
        ACard4.hidden=true
        ACard5.hidden=true
        
        PCard1.hidden=true
        PCard2.hidden=true
        PCard3.hidden=true
        PCard4.hidden=true
        PCard5.hidden=true
        
        sharedData.agame.FirstDeal(sharedData.curbet)
        sharedData.agame.AIplayerPlay()
        
        //Dealer
        DCard1.hidden=false
        DCard2.hidden=false
        DCard1.image=UIImage(named: "CardBack.png")
        var Dcards:[String]=sharedData.agame.dealer.Getcurhand()
        DCard2.image=UIImage(named: Dcards[0]+".png")
        
        //AIPlayer
        var ACardView=[ACard1,ACard2,ACard3,ACard4,ACard5]
        var Acards:[String]=sharedData.agame.aiplayer.Getcurhand()
        var i:Int=0
        for acard in Acards{
            ACardView[i].hidden=false
            ACardView[i].image=UIImage(named: acard+".png")
            i++;
        }
        AIScore.text="Score: \(sharedData.agame.aiplayer.money)"
        AIBet.text="Bet: \(sharedData.agame.aiplayer.Getcurbet())"
        
        
        //MyPlayer
        PCard1.hidden=false
        PCard2.hidden=false
        PCard1.image=UIImage(named: sharedData.agame.myplayer.Getcurhand()[0]+".png")
        PCard2.image=UIImage(named: sharedData.agame.myplayer.Getcurhand()[1]+".png")
        UserScore.text="Score: \(sharedData.agame.myplayer.money)"
        UserBet.text="Score: \(sharedData.agame.myplayer.Getcurbet())"
        sharedData.UsercardNum=2
        
        
        NextButton.enabled=false
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func HitChoose(sender: AnyObject) {
        var curplayer=sharedData.agame.myplayer
        var PCardView=[PCard1,PCard2,PCard3,PCard4,PCard5]
        
        var curcardscore=curplayer.Getcurscore
        if  sharedData.UsercardNum>4{
            HitButton.enabled=false
            StandButton.enabled=false
            NextButton.enabled=true
            println("Exceed 5 cards!!")
            var results:[String]=sharedData.agame.CheckWin()
            AIResult.hidden=false
            AIResult.text=results[0]
            UserResult.hidden=false
            UserResult.text=results[1]
            
        }
        else if curcardscore()>21 {
            println("Exceed 21")
            HitButton.enabled=false
            StandButton.enabled=false
            NextButton.enabled=true
            ShowResults()
            
        }
        else{
            //Deal a Card
            var dealcard=sharedData.agame.DealACard(sharedData.agame.myplayer)
            var UserCardNum=sharedData.UsercardNum;
            //Display curplayer's cards
            PCardView[UserCardNum].hidden=false
            PCardView[UserCardNum].image=UIImage(named: dealcard)
            sharedData.UsercardNum++
            if curplayer.Getcurscore()>21{
                HitButton.enabled=false
                StandButton.enabled=false
                NextButton.enabled=true
                ShowResults()
            }
        }
        
        
    }
    
    @IBAction func StandChoose(sender: AnyObject) {
        
        NextButton.enabled=true
        StandButton.enabled=false
        HitButton.enabled=false
        ShowResults()

    }
    
    @IBAction func NextChoose(sender: AnyObject) {
        performSegueWithIdentifier("SecondtoFirst", sender: self)
    }
    
    
    func ShowResults(){
        
        sharedData.agame.DealerPlay()
        var results:[String]=sharedData.agame.CheckWin()
        var DcardView=[DCard1,DCard2,DCard3,DCard4,DCard5]
        var Dcards:[String]=sharedData.agame.dealer.Getcurhand()
        var i:Int=0
        for adcard in Dcards{
            DcardView[i].hidden=false
            DcardView[i].image=UIImage(named: adcard+".png")
            i++;
        }
        AIResult.hidden=false
        AIResult.text=results[0]
        UserResult.hidden=false
        UserResult.text=results[1]
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

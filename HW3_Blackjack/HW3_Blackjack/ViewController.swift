//
//  ViewController.swift
//  HW3_Blackjack
//
//  Created by Huibo Li on 3/30/15.
//  Copyright (c) 2015 Huibo Li. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var BetInput: UITextField!
    @IBOutlet weak var AlarmText: UILabel!
    @IBOutlet weak var CurMoney: UILabel!
    
    var sharedData:Singleton = Singleton.sharedInstance
    
       override func viewDidLoad() {
        BetInput.text="1";
        CurMoney.text="Your score is \(sharedData.agame.myplayer.money)";
        sharedData.agame.Shuffle()
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func PlayButton(sender: AnyObject) {
        if BetInput.text.toInt()==nil {
            println("This is not a number")
            AlarmText.hidden=false
            AlarmText.text="Wrong format!"
        }
        else if BetInput.text.toInt()<1{
            println("Less than 1")
            //AlarmText.textColor=UIColor.redColor()
            AlarmText.text="Your bet can not be less than 1!"
        }
        else{
            sharedData.curbet=BetInput.text.toInt()!;
            if sharedData.rounds==5{
                sharedData.agame.Shuffle();
            }
            sharedData.rounds++;
            performSegueWithIdentifier("FirsttoSecond", sender:self)
        }
    }

    @IBAction func RestartButton(sender: AnyObject) {
        sharedData.newGame()
        BetInput.text="1";
        CurMoney.text="Your score is \(sharedData.agame.myplayer.money)";
        performSegueWithIdentifier("FirsttoSecond", sender:self)
    }
    
}


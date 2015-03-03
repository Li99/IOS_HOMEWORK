//
//  ViewController.swift
//  HW2
//
//  Created by Huibo Li on 2/24/15.
//  Copyright (c) 2015 Huibo Li. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var DeckText: UITextField!
    @IBOutlet weak var PlayText: UITextField!
    
    let defaultdecknum:String = "3"
    let defaultpalyernum:String = "2"
    
    
    var sharedData:Singleton = Singleton.sharedInstance
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DeckText.text=defaultdecknum
        PlayText.text=defaultpalyernum
    }
    
    
    @IBAction func StartGame(sender: AnyObject) {
        if PlayText.text.toInt()==nil || DeckText.text.toInt()==nil{
            println("Input is not a number")
            let alertController = UIAlertController(title: "Warning", message: "Your Input is not a number", preferredStyle:.Alert)
            let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alertController.addAction(defaultAction)
            presentViewController(alertController, animated: true, completion: nil)

        }
        else if DeckText.text.toInt()<1{
            println("player num is 1-6")
            let alertController = UIAlertController(title: "Warning", message: "The number of Decks can't be less than 1", preferredStyle:.Alert)
            let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alertController.addAction(defaultAction)
            presentViewController(alertController, animated: true, completion: nil)
        }
        else if PlayText.text.toInt()>6 || PlayText.text.toInt()<1{
            println("player num is 1-6")
            let alertController = UIAlertController(title: "Warning", message: "The number of player is 1-6", preferredStyle:.Alert)
            let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alertController.addAction(defaultAction)
            presentViewController(alertController, animated: true, completion: nil)
        }
        else{
            sharedData.decknum=DeckText.text.toInt()!
            sharedData.playernum=PlayText.text.toInt()!
            sharedData.curplayer=0
            sharedData.rounds=0
            //Start A Game
            sharedData.agame=Game(numOfDeck: sharedData.decknum, numOfPlayer: sharedData.playernum)
        }
    }
    
   /*override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "GotoSecond" {
            println("Start game")
            let controller = segue.destinationViewController as SecondViewController
            controller.playernum=PlayText.text
            controller.decknum=DeckText.text
        }
    }*/

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


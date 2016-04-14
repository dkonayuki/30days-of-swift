//
//  ViewController.swift
//  Psychologist
//
//  Created by dkonayuki on 4/13/16.
//  Copyright © 2016 ChillBears. All rights reserved.
//

import UIKit

class PsychologistViewController: UIViewController {

    // create segue dynamically
    @IBAction func nothing(sender: UIButton) {
        performSegueWithIdentifier("nothing", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var destination: UIViewController?
        if let nc = segue.destinationViewController as? UINavigationController {
            destination = nc.visibleViewController
        }
        if let hvc = destination as? HappinessViewController {
            if let identifier = segue.identifier {
                switch identifier {
                case "sad":
                    hvc.happiness = 0
                case "happy":
                    hvc.happiness = 100
                case "nothing":
                    hvc.happiness = 25
                default:
                    hvc.happiness = 50
                }
            }
        }
    }

}


//
//  ViewController.swift
//  Cassini
//
//  Created by dkonayuki on 4/20/16.
//  Copyright © 2016 ChillBears. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let ivc = segue.destinationViewController as? ImageViewController {
            if let identifier = segue.identifier {
                switch identifier {
                    case "Show Earth":
                        ivc.imageURL = DemoURL.NASA.Earth
                        ivc.title = "Earth"
                    case "Show Saturn":
                        ivc.imageURL = DemoURL.NASA.Saturn
                        ivc.title = "Saturn"
                    case "Show Cassini":
                        ivc.imageURL = DemoURL.NASA.Cassini
                        ivc.title = "Cassini"
                default: break
                }
            }
        }
    }

}


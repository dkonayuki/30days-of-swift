//
//  ViewController.swift
//  StopWatch
//
//  Created by dkonayuki on 3/8/16.
//  Copyright © 2016 ChillBears. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var timeLabel: UILabel!
    
    var timer = NSTimer()
    var count:Float = 0
    
    @IBAction func playButton(sender: AnyObject) {
        timer.invalidate()
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "update", userInfo: nil, repeats: true)
    }
    
    @IBAction func pauseButton(sender: AnyObject) {
        timer.invalidate()
    }
    
    func update() {
        count += 0.1
        timeLabel.text = "\(count)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


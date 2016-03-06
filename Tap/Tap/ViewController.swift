//
//  ViewController.swift
//  Tap
//
//  Created by dkonayuki on 3/6/16.
//  Copyright © 2016 ChillBears. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var countLabel: UILabel!


    var count = 0
    @IBAction func tapButton(sender: UIButton) {
        count++
        updateCountLabel()
    }
    
    @IBAction func resetButton(sender: UIButton) {
        count = 0
        updateCountLabel()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        count = 0
        updateCountLabel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateCountLabel() {
        countLabel.text = "\(count)"
    }


}


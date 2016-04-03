//
//  ViewController.swift
//  Calculator
//
//  Created by dkonayuki on 3/29/16.
//  Copyright © 2016 ChillBears. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    
    var userIsInTheMiddleOfTypingANumber = false
    
    var brain = CalculatorBrain()
    
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if (userIsInTheMiddleOfTypingANumber == false) {
            userIsInTheMiddleOfTypingANumber = true
            display.text = digit
        } else {
            display.text = display.text! + digit
        }
    }    
    
    @IBAction func operate(sender: UIButton) {
        if (userIsInTheMiddleOfTypingANumber) {
            enter()
        }
        if let operation = sender.currentTitle {
            if let result = brain.performOperation(operation) {
                displayValue = result;
            } else {
                displayValue = 0;
            }
        }

    }
    
    @IBAction func enter() {
        userIsInTheMiddleOfTypingANumber = false
        if let result = brain.pushOperand(displayValue) {
            displayValue = result
        } else {
            displayValue = 0
        }
        
    }
    
    //computed property
    var displayValue: Double {
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set {
            display.text = "\(newValue)"
            userIsInTheMiddleOfTypingANumber = false
        }
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


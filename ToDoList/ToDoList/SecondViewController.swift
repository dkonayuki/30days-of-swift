//
//  SecondViewController.swift
//  ToDoList
//
//  Created by dkonayuki on 3/28/16.
//  Copyright © 2016 ChillBears. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var nameField: UITextField!
    @IBOutlet var descField: UITextField!
    
    @IBAction func addTask(sender: UIButton) {
        taskMgr.addTask(nameField.text!, desc: descField.text!)
        self.view.endEditing(true)
        nameField.text = ""
        descField.text = ""
        self.tabBarController!.selectedIndex = 0;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let tab: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tab)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    //ios touch function
/*
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
*/

    //UITextField delegate
    internal func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}


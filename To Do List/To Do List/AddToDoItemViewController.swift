//
//  AddToDoItemViewController.swift
//  To Do List
//
//  Created by Eugene Tsai on 2/23/16.
//  Copyright © 2016 Eugene. All rights reserved.
//

import UIKit

class AddToDoItemViewController: UIViewController {

    
    @IBOutlet var taskToAdd: UITextField!
    
    @IBAction func addTask(sender: AnyObject) {
        listOfTable.append(taskToAdd.text!)
        completeTable.append(false)
        taskToAdd.text = ""
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "closeKeyboard")
        view.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func closeKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
}


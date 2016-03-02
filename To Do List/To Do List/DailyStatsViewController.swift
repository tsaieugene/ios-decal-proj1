//
//  DailyStatsViewController.swift
//  To Do List
//
//  Created by Eugene Tsai on 2/23/16.
//  Copyright © 2016 Eugene. All rights reserved.
//

import UIKit

class DailyStatsViewController: UIViewController {
    
    
    @IBOutlet var TasksCompleted: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let i = countCompletedTasks()
        TasksCompleted.text = "\(i)"
    }
    
    override func viewDidAppear(animated: Bool) {
        let i = countCompletedTasks()
        TasksCompleted.text = "\(i)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func countCompletedTasks() -> Int {
        var i = 0
        for item in completeTable {
            if item == true {
                i += 1
            }
        }
        return i
    }
}


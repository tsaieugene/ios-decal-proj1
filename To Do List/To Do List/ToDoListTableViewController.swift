//
//  ToDoListTableViewController.swift
//  To Do List
//
//  Created by Eugene Tsai on 2/23/16.
//  Copyright © 2016 Eugene. All rights reserved.
//

import UIKit

var listOfTable = [String]()
var completeTable = [Bool]()
let time = NSDate()
var times = [NSDate](count: 100, repeatedValue : time)

class ToDoListTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var table: UITableView!
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfTable.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let row = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Task")
        row.textLabel?.text = listOfTable[indexPath.row]
        if completeTable[indexPath.row] == true {
            row.accessoryType = UITableViewCellAccessoryType.Checkmark
        }
        return row
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        table.reloadData()
        var i = 0
        while i < completeTable.count {
            if completeTable[i] == true {
                let difference = NSDate().timeIntervalSinceDate(times[i])
                if difference >= 3600*24 {
                    listOfTable.removeAtIndex(i)
                    completeTable.removeAtIndex(i)
                    times[i] = NSDate()
                }
            }
            i++
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        if editingStyle == UITableViewCellEditingStyle.Delete {
            listOfTable.removeAtIndex(indexPath.row)
            completeTable.removeAtIndex(indexPath.row)
        }
        table.reloadData()
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let row = tableView.cellForRowAtIndexPath(indexPath){
            if row.accessoryType == UITableViewCellAccessoryType.None {
                row.accessoryType = UITableViewCellAccessoryType.Checkmark
                completeTable[indexPath.row] = true
                times[indexPath.row] = NSDate()
            } else {
                row.accessoryType = UITableViewCellAccessoryType.None
                completeTable[indexPath.row] = false
                times.removeAtIndex(indexPath.row)
                times.append(NSDate())
            }
        }
    }
    
}


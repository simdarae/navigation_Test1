//
//  TableViewController.swift
//  navigation_Test1
//
//  Created by 심다래 on 2015. 11. 16..
//  Copyright © 2015년 XNRND. All rights reserved.
//

import Foundation
import UIKit

var tableCount = 0;

class TableViewController: UITableViewController {
    
    
    override func viewDidLoad() {
        print("1")
        super.viewDidLoad()
        let action = ViewController()
        tableCount = action.GetCount()
    
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        print("2")
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var data = ["Apple", "Apricot", "Banana", "Blueberry", "Cantaloupe", "Cherry",
        "Clementine", "Coconut", "Cranberry", "Fig", "Grape", "Grapefruit",
        "Kiwi fruit", "Lemon", "Lime", "Lychee", "Mandarine", "Mango",
        "Melon", "Nectarine", "Olive", "Orange", "Papaya", "Peach",
        "Pear", "Pineapple", "Raspberry", "Strawberry"]
    
    // MARK: - UITableViewDataSource
    
    override func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        print("numberOfSectionsInTableView call")
        //        return Business.count
        
        return tableCount
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        print("1111")
        let cell = tableView.dequeueReusableCellWithIdentifier("FruitCell", forIndexPath: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
}
    
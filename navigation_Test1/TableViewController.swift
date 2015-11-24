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
    
    @IBOutlet var table: UITableView!
    
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
    
    // MARK: - UITableViewDataSource
    
    override func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        print("numberOfSectionsInTableView call")
        
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(tableCount)
        return tableCount
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = table.dequeueReusableCellWithIdentifier("FruitCell", forIndexPath: indexPath)
        cell.textLabel?.text = "\(indexPath.row + 1)"
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //내가 프리젠트 한 사람이 누구냐
        let topView = self.presentingViewController as? UINavigationController
        
        //나를 프리젠트 한 사람이 누구냐
        presentingViewController?.dismissViewControllerAnimated(true) { () -> Void in
            assert(topView!.viewControllers.count > indexPath.row)
            
            topView!.popToViewController(topView!.viewControllers[indexPath.row], animated: true)
        }
    }
    
    //메뉴가 있는 view : splitView
}
    
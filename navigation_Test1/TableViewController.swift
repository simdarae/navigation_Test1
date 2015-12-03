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

let notificationCenter = NSNotificationCenter.defaultCenter()


class TableViewController: UITableViewController {
    
    @IBOutlet var table: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let action = ViewController()
        tableCount = action.GetCount()
        
        super.viewDidLoad()
    
//        notificationCenter.addObserver(self,
//            selector: "setCount:",
//            name: "simple-notification2",
//            object: nil)
//        
//        notificationCenter.postNotificationName("simple-notification", object: nil)

    }
    
//    deinit {
//        notificationCenter.removeObserver(self)
//    }
//    
//    func setCount(notification: NSNotification) {
//        let message: String? = notification.userInfo!["Count"] as? String
//        
//        let a:Int? = Int(message!)
//        tableCount = Int(a!)
//    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UITableViewDataSource
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableCount
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
        let cell = table.dequeueReusableCellWithIdentifier("FruitCell", forIndexPath: indexPath)
        cell.textLabel?.text = "\(indexPath.row + 1)"
        return cell
        
//        let cell = table.dequeueReusableCellWithIdentifier("FruitCell", forIndexPath: indexPath)
//        //대입할것이 널이라면 무시한다.
//        //!은 반드시 값이 있을 경우
//        cell.textLabel?.text = "\(indexPath.row + 1)"
//        //text는 반드시 있어야 하니까 !로 바꿔준다
//        cell.textLabel!.text = "\(indexPath.row + 1)"
//        //cell.textLabel!.alignmentRectForFrame(center)
        
    }

    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //내가 프리젠트 한 사람이 누구냐
        //topview는 반드시 네이게이션컨트롤러여야한다 의미로 ! 해줘야한다
       // let topView = self.presentingViewController as! UINavigationController!

        //나를 프리젠트 한 사람이 누구냐
        presentingViewController?.dismissViewControllerAnimated(true) { () -> Void in
//            assert(topView.viewControllers.count > indexPath.row)
//            
//            topView.popToViewController(topView.viewControllers[indexPath.row], animated: true)
            NSNotificationCenter.defaultCenter().postNotificationName("TabalViewCall", object: self, userInfo: ["TabalViewCall" : indexPath.row])
        }
    }
    
    //메뉴가 있는 view : splitView
}
    
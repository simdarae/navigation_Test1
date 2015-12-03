//
//  TopNavigationController.swift
//  navigation_Test1
//
//  Created by 심다래 on 2015. 12. 3..
//  Copyright © 2015년 XNRND. All rights reserved.
//

import Foundation
import UIKit

class TopNavigationController: UINavigationController {
    
    var observer : NSObjectProtocol?;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        addObservers()
    }
    
    deinit {
        // meaningless on current context
        removeObservers()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addObservers() {
        // object : limit sender
        observer = NSNotificationCenter.defaultCenter().addObserverForName("TabalViewCall", object: nil, queue: nil) { (notification:NSNotification) -> Void  in
            
            if let depth:Int = notification.userInfo?["TabalViewCall"] as? Int {
                assert(self.viewControllers.count > depth)
                self.popToViewController(self.viewControllers[depth], animated: true)
            }
        }
    }
    
    func removeObservers() {
        if let observer = observer {
            NSNotificationCenter.defaultCenter().removeObserver(observer);
        }
    }
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}

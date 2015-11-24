//
//  ViewController.swift
//  navigation_Test1
//
//  Created by 심다래 on 2015. 11. 2..
//  Copyright © 2015년 XNRND. All rights reserved.
//

import UIKit

var Count = 0;

class ViewController: UIViewController {

    //test
    @IBOutlet weak var value_num: UILabel!
    @IBOutlet weak var resetBtn: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        print("viewWillAppear")
        
        if (self.navigationController!.viewControllers.count == 1) {
           resetBtn.enabled = false
        }
        
        self.changeView()
        
    }
    
    func SetCount(count: Int) {
        Count = count;
    }
    
    func GetCount() -> Int {
        return Count;
    }

    
    @IBAction func handleGesture(sender: AnyObject) {
        
        if sender.state == UIGestureRecognizerState.Began
        {
            print("handleGesture")
            let tableController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("TableViewController") as! UINavigationController
            
            //let action = AppDelegate()
            SetCount(self.navigationController!.viewControllers.count)
            
            presentViewController(tableController, animated: true, completion: nil)
        }
    }
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        self.changeView()
    }
    
    func changeView() {
        let deviceOrientation : UIDeviceOrientation = UIDevice.currentDevice().orientation
    
        if (deviceOrientation == .LandscapeLeft || deviceOrientation == .LandscapeRight) {
            print("가로")
            value_num.text = self.intToHangul(self.navigationController!.viewControllers.count)
            self.navigationController?.title = self.intToHangul(self.navigationController!.viewControllers.count)
            
        } else {
            print("세로")
            value_num.text = String(self.navigationController!.viewControllers.count)
        }
    }
    
    
    @IBAction func reset(sender: AnyObject) {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }

    @IBAction func BtnNext(sender: AnyObject) {
        
        let viewController : ViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("ViewController") as! ViewController
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func intToHangul(num: Int) -> String {
        let x0 : [String] = ["", "", "이", "삼", "사", "오", "육", "칠", "팔", "구"]
        let x1 : [String] = ["", "일", "이", "삼", "사", "오", "육", "칠", "팔", "구"]
        let x10 : [String] = ["", "십", "백", "천"]
        let x10000 : [String] = ["", "만", "억", "조", "경"]
        
        var currentPos = 0
        var remainNum = num
        var han : String = ""
        
        while (true) {
            let digit = remainNum % 10
            remainNum = remainNum / 10
            
            if ((currentPos % 4) == 0) {
                han = x1[digit] + x10000[currentPos / 4] + han
            }
            else {
                han = x0[digit] + x10[currentPos % 4] + han
            }
            
            if (remainNum == 0) {
                break
            }
            currentPos += 1
        }
        
        return han
    }
}


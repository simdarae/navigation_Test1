//
//  ViewController.swift
//  navigation_Test1
//
//  Created by 심다래 on 2015. 11. 2..
//  Copyright © 2015년 XNRND. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    //test
    @IBOutlet weak var value_num: UILabel!
    @IBOutlet weak var value_han: UILabel!
    @IBOutlet weak var resetBtn: UIBarButtonItem!
    
    override func viewDidLoad() {
        print("viewDidLoad")
        super.viewDidLoad()
        self.changelange()
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
        
        let depth : String = String(self.navigationController!.viewControllers.count)
        
        value_han.text = self.intToHangul(self.navigationController!.viewControllers.count)
        value_num.text = String(self.navigationController!.viewControllers.count)
        self.navigationController?.title = String(depth)
        
    }
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        print("viewWillTransitionToSize")
        self.changelange()
    }
    
    func changelange() {
        
        print("changelange")
        let deviceOrientation : UIDeviceOrientation = UIDevice.currentDevice().orientation
        
        /*
        if (deviceOrientation == .LandscapeLeft || deviceOrientation == .LandscapeRight) {
        //if UIDevice.currentDevice().orientation.isLandscape.boolValue {
            print("가로")
            
            value_han.text = self.intToHangul(self.navigationController!.viewControllers.count)
            value_num.text = String(self.navigationController!.viewControllers.count)
            self.navigationController?.title = self.intToHangul(self.navigationController!.viewControllers.count)
            
        } else {
            print("세로")
            
            value_han.text = self.intToHangul(self.navigationController!.viewControllers.count)
            value_num.text = String(self.navigationController!.viewControllers.count)
        }*/
        
        if (deviceOrientation == .LandscapeLeft || deviceOrientation == .LandscapeRight) {
            value_num.alpha = 0.0
            value_han.alpha = 1.0
        }
        else {
            value_num.alpha = 1.0
            value_han.alpha = 0.0
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

    
    func translate(Number : Int, level : Int) -> String {
        
        var str = ""
        var won = ""
        var dan = ""

        
        switch Number
        {
        case 0: won = "영"; break
        case 1: won = "일"; break
        case 2: won = "이"; break
        case 3: won = "삼"; break
        case 4: won = "사"; break
        case 5: won = "오"; break
        case 6: won = "육"; break
        case 7: won = "칠"; break
        case 8: won = "팔"; break
        case 9: won = "구"; break
        default: won = "";
        }
        
        switch level
        {
        case 7: dan = "백만"; break
        case 6: dan = "십만"; break
        case 5: dan = "만"; break
        case 4: dan = "천"; break
        case 3: dan = "백"; break
        case 2: dan = "십"; break
        case 1: dan = ""; break
        default: dan = "";
        }
        
        str = won + dan
        return String(str)
    }
}


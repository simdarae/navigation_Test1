//
//  ViewController.swift
//  navigation_Test1
//
//  Created by 심다래 on 2015. 11. 2..
//  Copyright © 2015년 XNRND. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var value_num: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        let depth : String = String(self.navigationController!.viewControllers.count)
        
        value_num.text = String(depth)
        self.navigationController?.title = String(depth)
    }
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        if UIDevice.currentDevice().orientation.isLandscape.boolValue {
            print("landscape")
            let depth : String = String(self.navigationController!.viewControllers.count)
            var i=0;
            var str : String = "";
            
            print(depth.characters.count)
            
            
            for(i=0; i<depth.characters.count; i++)
            {
                str =  str + self.translate(self.navigationController!.viewControllers.count, level: i)
            }
            
            print(str)
            
            value_num.text = String(str)
            self.navigationController?.title = String(str)
            
        } else {
            print("portraight")
            
            let depth : String = String(self.navigationController!.viewControllers.count)
            
            value_num.text = String(depth)
            self.navigationController?.title = String(depth)
        }
    }

    @IBAction func BtnNext(sender: AnyObject) {
        
        let viewController : ViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("ViewController") as! ViewController
        
        self.navigationController?.pushViewController(viewController, animated: true)
        
        if UIDevice.currentDevice().orientation.isLandscape.boolValue {
            print("landscape")
            let depth : String = String(self.navigationController!.viewControllers.count)
            var i=0;
            var str : String = "";
            
            print(depth.characters.count)
            
            
            for(i=0; i<depth.characters.count; i++)
            {
                str =  str + self.translate(self.navigationController!.viewControllers.count, level: i)
            }
            
            print(str)
            
            value_num.text = String(str)
            self.navigationController?.title = String(str)
            
        } else {
            print("portraight")
            
            let depth : String = String(self.navigationController!.viewControllers.count)
            
            value_num.text = String(depth)
            self.navigationController?.title = String(depth)
        }

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


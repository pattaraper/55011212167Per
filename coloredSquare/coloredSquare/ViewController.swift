//
//  ViewController.swift
//  coloredSquare
//
//  Created by student on 11/7/14.
//  Copyright (c) 2014 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   // let coloredSquare = UIView()
   // let velocity = 1.0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      /*  coloredSquare.backgroundColor = UIColor.blueColor()
        coloredSquare.frame = CGRect(x: 0, y: 120, width: 50, height: 50)
        self.view.addSubview(coloredSquare)
        
        UIView.animateWithDuration(5.0, animations: {
            self.coloredSquare.backgroundColor = UIColor.redColor()
            self.coloredSquare.frame = CGRect(x: 320-50, y: 120, width: 50, height: 50)
        })
        
        UIView.animateWithDuration(1.0, delay: 0.0, options: options, animations: {
            self.coloredSquare.backgroundColor = UIColor.redColor()
            self.coloredSquare.frame = CGRect(x: 320-50, y: 120, width: 50, height: 50)
            
            }, completion: nil)*/
    }
    
    @IBAction func animateButton(sender: AnyObject) {
       /* coloredSquare.backgroundColor = UIColor.blueColor()
        coloredSquare.frame = CGRect(x:0, y:120, width:50, height:50)
        self.view.addSubview(coloredSquare)
        
        UIView.animateWithDuration(2.0, animations: {
            self.coloredSquare.backgroundColor = UIColor.redColor()
            self.coloredSquare.frame = CGRect(x: 320-50, y: 120, width: 50, height: 50)
        })*/
        
        for loopNumber in 0...10 {
            let duration : NSTimeInterval = 1.0
            let delay = NSTimeInterval( ((Int(rand()) %  900)+100.0) / 1000.0)
            let options = UIViewAnimationOptions.CurveLinear
            let fish = UIImageView()
            let size : CGFloat = CGFloat( Int(rand()) %  40 + 20.0)
            let yPosition : CGFloat = CGFloat( Int(rand()) %  200 + 20.0)

            fish.image = UIImage(named: "fish.png")
            fish.frame = CGRectMake(0-size, yPosition, size, size)
            self.view.addSubview(fish)
            
            UIView.animateWithDuration(duration,delay:delay, options: options, animations: {
                fish.frame = CGRectMake(320, yPosition, size, size)
                
                }, completion: { animationFinished in
                    fish.removeFromSuperview()
            })
        
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


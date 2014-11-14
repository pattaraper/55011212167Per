//
//  ViewController.swift
//  Quiz
//
//  Created by student on 11/14/14.
//  Copyright (c) 2014 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let barrier = UIView(frame: CGRect(x:340, y:270, width:30, height:100))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        barrier.backgroundColor = UIColor.redColor()
        view.addSubview(barrier)
    }
    @IBAction func clickButton(sender: AnyObject) {
        var count = 0
        
       // for(;;++count) {
            
            let size : CGFloat = CGFloat(Int(rand())%100+20.0)
            let yPosition : CGFloat = CGFloat(Int(rand())%550+20.0)
            let delay =  NSTimeInterval( ((Int(rand()) %  900)+100.0) / 1000.0)
           // let delay : NSTimeInterval = 0.0
            let duration : NSTimeInterval = 1.0
            //let options = UIViewAnimationOptions.CurveLinear
            let options = UIViewAnimationOptions.Autoreverse | UIViewAnimationOptions.Repeat | UIViewAnimationOptions.CurveEaseInOut
            let minion = UIImageView()
            minion.image = UIImage(named: "moving_animated_scuba_fish_swimming.gif")
            minion.frame = CGRectMake(0, yPosition, size, size)
            self.view.addSubview(minion)
            
            UIView.animateWithDuration(duration, delay: delay, options: options, animations: {
                minion.frame = CGRectMake( 320, yPosition, size, size)
            
                }, completion: { animationFinished in
                    
                    minion.removeFromSuperview()
            })
       // }
    }
   /* override func touchesMoved(touches: NSSet, withEvent event: UIEvent){
        UITouch Drag = []
        barrier.center = [Drag locationInView: self.view]
        
        if(barrier.center.y < 30){
            barrier.center = CGPointMake(30, barrier.center.x)
        }
        if(barrier.center.y > 300){
            barrier.center = CGPointMake(300, barrier.center.x)
        }
        if(barrier.center.x < 340){
            barrier.center = CGPointMake(barrier.center.y, 340)
        }
        if(barrier.center.x > 340){
            barrier.center = CGPointMake(barrier.center.y, 340)
        }
    }*/
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}


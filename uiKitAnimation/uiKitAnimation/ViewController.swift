//
//  ViewController.swift
//  uiKitAnimation
//
//  Created by student on 11/7/14.
//  Copyright (c) 2014 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollisionBehaviorDelegate {
    var square: UIView!
    var animator: UIDynamicAnimator!
    var gravity: UIGravityBehavior!
    var collision: UICollisionBehavior!
    var snap: UISnapBehavior!
    var panGesture: UIPanGestureRecognizer!
    override func viewDidLoad() {
        super.viewDidLoad()
        let barrier = UIView(frame: CGRect(x:0, y:550, width:130, height:20))
        
        square = UIView(frame: CGRect(x:100, y:100 ,width:100 ,height:100))
        //square.layer.cornerRadius = 50
        
        square.backgroundColor = UIColor.grayColor()
        view.addSubview(square)
        
        animator = UIDynamicAnimator(referenceView: view)
        gravity = UIGravityBehavior(items: [square])
        animator.addBehavior(gravity)
        
        collision = UICollisionBehavior(items: [square])
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
        
        barrier.backgroundColor = UIColor.redColor()
        view.addSubview(barrier)
        
        collision.addBoundaryWithIdentifier("barrier", forPath: UIBezierPath(rect: barrier.frame))
        collision.collisionDelegate = self
        collision.action = {
            println("\(NSStringFromCGAffineTransform(self.square.transform)) \(NSStringFromCGPoint(self.square.center))")
        }
        
        let itemBehaviour = UIDynamicItemBehavior(items: [square])
        itemBehaviour.elasticity = 1.1
        animator.addBehavior(itemBehaviour)
        
        self.panGesture = UIPanGestureRecognizer(target: self, action: "panning:")
        self.square!.addGestureRecognizer(panGesture)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    func collisionBehavior(behavior: UICollisionBehavior!, beganContactForItem item: UIDynamicItem!, withBoundaryIdentifier identifier: NSCopying!, atPoint p: CGPoint) {
        println("Boundary contact occurred - \(identifier)")
        
        let collidingView = item as UIView
        collidingView.backgroundColor = UIColor.yellowColor()
        UIView.animateWithDuration(0.3){
            collidingView.backgroundColor = UIColor.grayColor()
        }
        
      /*  var firstContact = false
        if (!firstContact) {
            firstContact = true
            
            let square = UIView(frame: CGRect(x: 30, y: 0, width: 20, height: 20))
            square.backgroundColor = UIColor.grayColor()
            view.addSubview(square)
            
            collision.addItem(square)
            gravity.addItem(square)
            
            let attach = UIAttachmentBehavior(item: collidingView, attachedToItem:square)
            animator.addBehavior(attach)
        }*/
    }
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        if(snap != nil){
            animator.removeBehavior(snap)
        }
        
        let touch = touches.anyObject() as UITouch
        snap = UISnapBehavior(item: square, snapToPoint: touch.locationInView(view))
        animator.addBehavior(snap)
        
    }
    func panning(pan: UIPanGestureRecognizer){
        println("Out box is panning...")
        var location = pan.locationInView(self.view)
        var touchLocation = pan.locationInView(self.square)
        if (pan.state == UIGestureRecognizerState.Began){
            self.animator!.removeAllBehaviors()
            self.square!.center = location;
        }else if(pan.state == UIGestureRecognizerState.Changed){
            self.square!.center = location;
        }else if(pan.state == UIGestureRecognizerState.Ended){
            self.animator!.addBehavior(self.gravity)
            self.animator!.addBehavior(self.collision)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


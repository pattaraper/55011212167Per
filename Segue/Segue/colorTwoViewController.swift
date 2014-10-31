//
//  colorTwoViewController.swift
//  Segue
//
//  Created by student on 10/17/14.
//  Copyright (c) 2014 student. All rights reserved.
//

import UIKit
protocol ColorTwoViewControllerDelegate{
    func myVCDidFinish(controller: colorTwoViewController,text:String)
}

class colorTwoViewController: UIViewController {
    
    @IBOutlet var red: UIButton!
    @IBOutlet var green: UIButton!
    @IBOutlet var blue: UIButton!
    
    @IBOutlet weak var colorLable: UILabel!
    var delegate:ColorTwoViewControllerDelegate? = nil
    var colorString = ""
    
    
    @IBAction func colorSelectionButton(sender: UIButton) {
        colorLable.text = sender.titleLabel!.text!
        
        if(colorLable.text == "Red"){
            colorLable.textColor = UIColor.redColor()
        }
        if(colorLable.text == "Random"){
            
            colorLable.textColor = getRandomColor()
            
        }
        if(colorLable.text == "Blue"){
            colorLable.textColor = UIColor.blueColor()
        }
    }
    func getRandomColor() -> UIColor{
        
        var randomRed:CGFloat = CGFloat(drand48())
        
        var randomGreen:CGFloat = CGFloat(drand48())
        
        var randomBlue:CGFloat = CGFloat(drand48())
        
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
        
    }
    @IBAction func saveColor(sender: AnyObject) {
        if(delegate != nil){
            delegate!.myVCDidFinish(self, text: colorLable!.text!)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        colorLable.text = colorString
        colorLable.layer.borderWidth = 2
        colorLable.layer.borderColor = UIColor.blackColor().CGColor
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
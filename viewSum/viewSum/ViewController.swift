//
//  ViewController.swift
//  viewSum
//
//  Created by student on 9/12/14.
//  Copyright (c) 2014 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var label1: UILabel!
    @IBOutlet var label2: UILabel!
    @IBOutlet var label3: UILabel!
    var One = 0
    var Two = 0
    var Three = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func acbutton1(sender: AnyObject) {
        One += 1
        label1.text = "\(One)"
    }
    @IBAction func acbutton2(sender: AnyObject) {
        Two += 1
        label2.text = "\(Two)"
    }
    @IBAction func acbutton3(sender: AnyObject) {
        Three += 1
        label3.text = "\(Three)"
    }
    @IBAction func acbuttonReset(sender: AnyObject) {
        One = 0
        Two = 0
        Three = 0
        label1.text = "\(One)"
        label2.text = "\(Two)"
        label3.text = "\(Three)"
    }


}


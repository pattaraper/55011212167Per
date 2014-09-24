//
//  ViewController.swift
//  TableViewMenu
//
//  Created by student on 9/24/14.
//  Copyright (c) 2014 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    let cellIdentifier = "cellIdentifier"
    var tableData = ["Bus","Helicopter","Truck"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: self.cellIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(self.cellIdentifier) as UITableViewCell
        cell.textLabel!.text =  tableData[indexPath.row]
        var imageName = UIImage(named : tableData[indexPath.row])
        cell.imageView!.image = imageName
        return cell
    }
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath!) {
        let alert = UIAlertController(title: "item Select", message: "Your Selected item \(tableData[indexPath.row])", preferredStyle: UIAlertControllerStyle.Alert)
       
        alert.addAction(UIAlertAction(title: "OK",style: UIAlertActionStyle.Default,handler: {(alert:UIAlertAction!)in print("An Alert if type\(alert.style.hashValue)was tapped!")}))
       
        self.presentViewController(alert, animated: true, completion: nil)
        
        
    }
    

}


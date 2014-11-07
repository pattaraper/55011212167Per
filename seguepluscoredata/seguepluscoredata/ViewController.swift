//
//  ViewController.swift
//  seguepluscoredata
//
//  Created by student on 10/31/14.
//  Copyright (c) 2014 student. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController,UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    var items = [String]()
    
    override func viewDidLoad() {
        title = "\"Profile\""
        super.viewDidLoad()
    }
   func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell
        let item = items[indexPath.row]
     //   cell.nameTextField!.text = item.valueForKey("name") as String?
        return cell
    }
    func myVCDidFinish(controller: addToViewController, name: String,idName:String) {
        controller.navigationController?.popViewControllerAnimated(true)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "mySegue"){
            let vc = segue.destinationViewController as addToViewController
        }
    }
    
}


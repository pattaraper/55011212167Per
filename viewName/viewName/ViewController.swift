//
//  ViewController.swift
//  viewName
//
//  Created by student on 9/26/14.
//  Copyright (c) 2014 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate {
    @IBOutlet var inputName: UILabel!
    @IBOutlet var fieldName: UITextField!
    @IBOutlet var viewName: UITableView!
    var name = [String]()
    let cellIdentifier = "cellIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func add(sender: AnyObject) {
        var get = fieldName.text
        name.append(get)
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)as UITableViewCell
        cell.textLabel!.text = name[indexPath.row]
        self.viewName.reloadData()
        return cell
    }
}


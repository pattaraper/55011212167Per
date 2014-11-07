//
//  addToViewController.swift
//  seguepluscoredata
//
//  Created by student on 10/31/14.
//  Copyright (c) 2014 student. All rights reserved.
//

import UIKit
protocol addToViewControllerDelegate{
    func myVCDidFinish(controller: addToViewController,name:String,idName:String)
}

class addToViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var idNameTextField: UITextField!
    var delegate:addToViewControllerDelegate? = nil
    var items = [String]()
    
    @IBAction func saveData(sender: AnyObject) {
        if(delegate != nil){
            delegate!.myVCDidFinish(self, name: nameTextField!.text!,idName:idNameTextField!.text!)
        }
       /*
    }
    func saveName(name: String,idName:String){
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        let entity = NSEntityDescription.entityForName("Item", inManagedObjectContext: managedContext)
        let item = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        item.setValue(name, forKey: "name")
        item.setValue(idName, forKey: "idName")
       
        var error: NSError?
        if !managedContext.save(&error){
            println("Could not save \(error),\(error?.userInfo)")
        }
        items.append(item)*/
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

//
//  ViewController.swift
//  TipCalculator
//
//  Created by student on 9/12/14.
//  Copyright (c) 2014 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate{
    
    @IBOutlet var totalTextField :UITextField!
    @IBOutlet var taxPctslider : UISlider!
    @IBOutlet var taxPctLabel : UILabel!
    @IBOutlet var resultTextView : UITextView!
    @IBOutlet var TableView: UITableView!
   
    
    let tipCalc = TipCalculatorModel(total: 33.35, taxPct : 0.06)
    var possibleTips = Dictionary<Int, (tipAmt:Double,total:Double)>()
    var sortedKeys:[Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        refreshUI()
    }
    @IBAction func viewTapped(sender: AnyObject) {
        totalTextField.resignFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func calculateTapped(sender: AnyObject) {
        
        tipCalc.total = Double((totalTextField.text as NSString).doubleValue)
        possibleTips = tipCalc.returnPossibleTips()
        sortedKeys = sorted(Array(possibleTips.keys))
        TableView.reloadData()
        
    }

    @IBAction func taxPercentageChanged(sender: AnyObject) {
        tipCalc.taxPct = Double(taxPctslider.value) / 100.0
        refreshUI()
    }
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int{
        return sortedKeys.count
    }
    func numberOfSectionInTableView(tableView: UITableView!) -> Int{
        return 1
    }
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        
    }
    func tableView(tableView: UITableView!,cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!{
        var cell = UITableViewCell(style: UITableViewCellStyle.Value2,reuseIdentifier: nil)
        
        let tipPct = sortedKeys[indexPath.row]
        let tipAmt = possibleTips[tipPct]!.tipAmt
        let total = possibleTips[tipPct]!.total
        
        cell.textLabel!.text = "\(tipPct)%:"
        cell.detailTextLabel!.text = String(format:"Tip: $%0.2f, Total: $%0.2f", tipAmt, total)
        return cell
        
    }
    
    func refreshUI(){
    //1
        totalTextField.text = String(format : "%0.2f",tipCalc.total)
    //2
        taxPctslider.value = Float(tipCalc.taxPct)*100.0
    //3
        taxPctLabel.text = "Tax Percentage(\(Int(taxPctslider.value))%):"
    
    }
}


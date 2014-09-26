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
    @IBOutlet var resultsTableView: UITableView!
   
    
    let tipCalc = TipCalculatorModel(total: 33.35, taxPct : 0.06)
    var sortedkeys:[Int] = []
    var possibleTips = Dictionary <Int,(tipAmt:Double,total:Double)>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        refreshUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func calculateTapped(sender: AnyObject) {
        //1
        tipCalc.total = Double((totalTextField.text as NSString).doubleValue)
        //2
        let possibleTips = tipCalc.returnPossibleTips()
        var results = ""
        //3
        
        for(tipPct,tipValue)in possibleTips{
            //4
            results += "\(tipPct)%: \(tipValue)\n"
        }
       // resultsTableView. = results
    }

    @IBAction func taxPercentageChanged(sender: AnyObject) {
        tipCalc.taxPct = Double(taxPctslider.value) / 100.0
        refreshUI()
    }
    func tableview(tableView: UITableView!,numberOfRowsInSection section: Int)->Int{
        return sortedkeys.count
    }
    func numberOfSectionInTableView(tableView: UITableView!)->Int{
        return 1
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    func tableView(tableView:UITableView!,cellForRowAtIndexPath indexPath: NSIndexPath!)->UITableViewCell!{
        var cell = UITableViewCell(style: UITableViewCellStyle.Value2,reuseIdentifier:nil)
        let tipPct = sortedkeys[indexPath.row]
        let tipAmt = possibleTips[tipPct]!.tipAmt
        let total = possibleTips[tipPct]!.total
        var results = ""
        //3
        
        for(tipPct,tipValue)in possibleTips{
            //4
            results += "\(tipPct)%: \(tipValue)\n"
        }
        
        cell.textLabel!.text = "\(tipPct)%:"
        cell.detailTextLabel!.text = String(format:"Tip: $%0.2f, Total: $%0.2f",tipAmt,total)
        return cell
    }
    func refreshUI(){
    //1
        totalTextField.text = String(format : "%0.2f",tipCalc.total)
    //2
        taxPctslider.value = Float(tipCalc.taxPct)*100.0
    //3
        taxPctLabel.text = "Tax Percentage(\(Int(taxPctslider.value))%):"
    //4
         //resultsTableView = ""
    }
}


import UIKit
import CoreData

class ViewController: UIViewController,UITableViewDataSource {
    var items = [String]()
   // var items = [NSManagedObject]()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Data List"
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
     /*   let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        let fetchRequest = NSFetchRequest(entityName: "Item")
        var error:NSError?
        let fetchedResults = managedContext.executeFetchRequest(fetchRequest, error: &error) as [NSManagedObject]?
        if let results = fetchedResults {
            items = results
        }else{
            println("Could not fetch\(error),\(error!.userInfo)")
        }*/
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell
        
        let item = items[indexPath.row]
        cell.textLabel!.text = items[indexPath.row] as String?
       // cell.textLabel!.text = item.valueForkey("name") as String?
       
        return cell
    }
    @IBAction func Additem(sender: AnyObject) {
        var alert = UIAlertController(title: "ADD ITEM", message: "Add Name&Amount&Price:Amount", preferredStyle: .Alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .Default){(action: UIAlertAction!)-> Void in
            let textField1 = alert.textFields![0] as UITextField
            let textField2 = alert.textFields![1] as UITextField
            let textField3 = alert.textFields![2] as UITextField
            //self.saveName(textField1.text)
            //self.saveName(textField2.text)
            //self.saveName(textFiled3.text)
            self.items.append("Name : \(textField1.text)")
            self.items.append("Amount : \(textField2.text)")
            self.items.append("Price:Amount : \(textField3.text)")
            self.tableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Default){(action: UIAlertAction!)-> Void in}
        
        alert.addTextFieldWithConfigurationHandler{
            (textField1: UITextField!)-> Void in
        }
        alert.addTextFieldWithConfigurationHandler{
            (textField2: UITextField!)-> Void in
        }
        alert.addTextFieldWithConfigurationHandler{
            (textField3: UITextField!)-> Void in
        }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        
        presentViewController(alert, animated: true, completion: nil)
    }
 /*   func saveName(name: String,amount: integer_t,price: Double){
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        let entity = NSEntityDescription.entityForName("Item", inManagedObjectContext: managedContext)
        let item = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        item = setValue(name,amount,price, forKey: "name","amount","price")
       // item = setValue(amount, forKey: "amount")
       // item = setValue(price, forKey: "price")
        var error:NSError?
        if(!managedContext.save(&error)){
            println("Colud not save\(error),\(error?.userInfo)")
        }
        items.append(item)
    }*/

}


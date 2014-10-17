import UIKit

class ViewController: UIViewController {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var volumLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    
    @IBOutlet var nameText: UITextField!
    @IBOutlet var volumText: UITextField!
    @IBOutlet var priceText: UITextField!
    @IBOutlet var totalText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
       
    @IBAction func totalButton(sender: AnyObject) {
        var volum = Double((volumText.text as NSString).doubleValue)
        let price = Double((priceText.text as NSString).doubleValue)
        var total = volum * price
        totalText.text = "\(total)Bath"
    }
}


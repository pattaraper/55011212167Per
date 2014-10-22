
import UIKit

class ViewController: UIViewController,ColorTwoViewControllerDelegate {

    @IBOutlet var colorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func myVCDidFinish(controller: colorTwoViewController, text: String) {
        colorLabel.text = "Co: " + text
        controller.navigationController?.popViewControllerAnimated(true)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "mySegue"){
            let vc = segue.destinationViewController as colorTwoViewController
            vc.colorString = colorLabel.text!
            vc.delegate = self
        }
    }
    
}



import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var textFields : [UITextField]!
    var currentField: UITextField!
    var accessoryView : UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // configure accessory view
        let arr = UINib(nibName:"AccessoryView", bundle:nil).instantiate(withOwner:nil)
        self.accessoryView = arr[0] as! UIView
        let b = self.accessoryView.subviews[0] as! UIButton
        b.addTarget(self, action:#selector(doNextButton), for:.touchUpInside)
    }

    func textFieldDidBeginEditing(_ tf: UITextField) {
        self.currentField = tf // keep track of first responder
        tf.inputAccessoryView = self.accessoryView
        tf.keyboardAppearance = .dark
    }

    func textFieldShouldReturn(_ tf: UITextField) -> Bool {
        self.currentField = nil
        tf.resignFirstResponder()
        return true
    }
    
    @objc func doNextButton(_ sender: Any) {
        var ix = self.textFields.index(of:self.currentField)!
        ix = (ix + 1) % self.textFields.count
        let v = self.textFields[ix]
        v.becomeFirstResponder()
    }
}

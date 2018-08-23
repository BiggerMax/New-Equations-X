import UIKit
class QuadraticEquationVC: SupportiveFunc {
    @IBOutlet weak var backGroundImage: UIImageView!
    let supportiveFunc = SupportiveFunc()
    override func viewDidLoad() {
        super.viewDidLoad()
        if let rounding = UserDefaults.standard.value(forKey: "rounding") as? Int {
            if rounding == 0 {
                SETTINGS = 1.0
            } else if rounding == 1 {
                SETTINGS = 10.0
            } else if rounding == 2 {
                SETTINGS = 100.0
            } else if rounding == 3 {
                SETTINGS = 1000.0
            } else if rounding == 4 {
                SETTINGS = 10000.0
            }
        }
        supportiveFunc.applyMotionEffect(toView: backGroundImage, magnitude: 20)
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        toolBar.barTintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        toolBar.alpha = 0.8
        toolBar.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "⬇︎", style: .done, target: self, action: #selector(supportiveFunc.donePressed))
        let runButton = UIBarButtonItem(title: "=", style: .done, target: self, action: #selector(self.Calculate))
        let hyphen = UIBarButtonItem(title: "−", style: .done, target: self, action: #selector(self.addHyphen))
        toolBar.setItems([doneButton, flexibleSpace, hyphen, flexibleSpace, runButton], animated: false)
        a.inputAccessoryView = toolBar
        b.inputAccessoryView = toolBar
        c.inputAccessoryView = toolBar
    }
    @objc func addHyphen() {
        if a.isFirstResponder {
            a.text = "-"
        } else if b.isFirstResponder {
            b.text = "-"
        }else if c.isFirstResponder {
            c.text = "-"
        }
    }
    @IBOutlet weak var a: UITextField!
    @IBOutlet weak var b: UITextField!
    @IBOutlet weak var c: UITextField!
    @IBOutlet weak var x1: UILabel!
    @IBOutlet weak var x2: UILabel!
    @IBAction func Calc(_ sender: Any) {
        Calculate()
    }
    @objc func Calculate() {
        guard let checkValueA = a.text , !checkValueA.isEmpty else {
            supportiveFunc.alertMessage(alertText: "Enter (a) value")
            return
        }
        guard let checkValueB = b.text , !checkValueB.isEmpty else {
            supportiveFunc.alertMessage(alertText: "Enter (b) value")
            return
        }
        guard let checkValueC = c.text , !checkValueC.isEmpty else {
            supportiveFunc.alertMessage(alertText: "Enter (c) value")
            return
        }
        let aa = Double(a.text!)
        if aa == nil {
            supportiveFunc.alertMessage(alertText: "The Application accepts English numbers only!")
            return
        } else if aa == 0 {
            supportiveFunc.alertMessage(alertText: "In Quadratic Equations (a) should not be (0)")
            return
        }
        let bb = Double(b.text!)
        if bb == nil {
            supportiveFunc.alertMessage(alertText: "The Application accepts English numbers only!")
            return
        }
        let cc = Double(c.text!)
        if cc == nil {
            supportiveFunc.alertMessage(alertText: "The Application accepts English numbers only!")
            return
        }
        let bbb = pow(Double(bb!), 2)
        let delta = (bbb - 4 * aa! * cc!)
        if delta >= 0 {
            let del2 = sqrt(Double(delta))
            let xx = -1 * bb! + del2
            let xxb = -1 * bb! - del2
            let xx1 = xx / (2 * aa!)
            let xx2 = xxb / (2 * aa!)
            let xxx1 = round(SETTINGS * xx1)/SETTINGS
            let xxx2 = round(SETTINGS * xx2)/SETTINGS
            x1.text = ("X1 = \(xxx1)")
            x2.text = ("X2 = \(xxx2)")
        } else {
            let delI = abs(delta)
            let del2 = sqrt(Double(delI))
            let x01 = (-1 * bb!) / (2 * aa!)
            let x02 = (del2)/(2 * aa!)
            let x01i = round(SETTINGS * x01) / SETTINGS
            let x02i = round(SETTINGS * x02) / SETTINGS
            x1.text = ("X1 = \(x01i) + \(abs(x02i))i")
            x2.text = ("X2 = \(x01i) - \(abs(x02i))i")
        }
        self.view.endEditing(true)
    }
}

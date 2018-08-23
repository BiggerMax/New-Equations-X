import UIKit
class PercentageVC: SupportiveFunc {
    @IBOutlet weak var backGroundImage: UIImageView!
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
        applyMotionEffect(toView: backGroundImage, magnitude: 20)
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        toolBar.barTintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        toolBar.alpha = 0.8
        toolBar.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "⬇︎", style: .done, target: self, action: #selector(self.donePressed))
        let runButton = UIBarButtonItem(title: "=", style: .done, target: self, action: #selector(self.Calculate))
        toolBar.setItems([doneButton, flexibleSpace, runButton], animated: false)
        Sub.inputAccessoryView = toolBar
        Total.inputAccessoryView = toolBar
        orP.inputAccessoryView = toolBar
    }
    @IBOutlet weak var AlertLabel: UILabel!
    @IBOutlet weak var Sub: UITextField!
    @IBOutlet weak var Total: UITextField!
    @IBOutlet weak var orP: UITextField!
    @IBOutlet weak var Percentage: UILabel!
    @IBAction func SubEdited(_ sender: UITextField) {
        if Double(orP.text!) != nil {
            orP.text = nil
            AlertLabel.text = "Fill either the amount or the percentage (%)"
        }
    }
    @IBAction func PercentageEdited(_ sender: UITextField) {
        if Double(Sub.text!) != nil {
            Sub.text = nil
            AlertLabel.text = "Fill either the amount or the percentage (%)"
        }
    }
    @IBAction func Calc(_ sender: Any) {
        Calculate()
    }
    @objc func Calculate() {
        guard let checkValueTotal = Total.text , !checkValueTotal.isEmpty else {
            alertMessage(alertText: "Enter the Total value")
            return
        }
        var CalcType = "amount"
        let sub = Double(Sub.text!)
        let orp = Double(orP.text!)
        if sub == nil && orp == nil {
            alertMessage(alertText: "Fill either Sub Amount or % Value with English numbers only!")
            return
        } else if sub == nil {
            CalcType = "value"
        } else if orp == nil {
            CalcType = "amount"
        } else {
            alertMessage(alertText: "System Error")
        }
        let total = Double(Total.text!)
        if total == nil {
            alertMessage(alertText: "The Application accepts English numbers only!")
            return
        } else if total == 0 {
            alertMessage(alertText: "Value of (Total) cannot be (0)")
            return
        }
        if CalcType == "amount" {
            let percentage = sub! * 100 / total!
            let result = round(SETTINGS * percentage) / SETTINGS
            Percentage.text = "\(result) %"
        } else if CalcType == "value" {
            let percentage = orp! * total! / 100
            let result = round(SETTINGS * percentage) / SETTINGS
            Percentage.text = "Amount is: \(result)"
        } else {
            alertMessage(alertText: "SYSTEM ERROR")
        }
        Sub.resignFirstResponder()
        orP.resignFirstResponder()
        Total.resignFirstResponder()
        AlertLabel.text = ""
    }
}

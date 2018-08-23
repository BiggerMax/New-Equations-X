import UIKit
class CubicEquation: SupportiveFunc {
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
        let hyphen = UIBarButtonItem(title: "−", style: .done, target: self, action: #selector(self.addHyphen))
        toolBar.setItems([doneButton, flexibleSpace, hyphen, flexibleSpace, runButton], animated: false)
        a.inputAccessoryView = toolBar
        b.inputAccessoryView = toolBar
        c.inputAccessoryView = toolBar
        d.inputAccessoryView = toolBar
    }
    @objc func addHyphen() {
        if a.isFirstResponder {
            a.text = "-"
        } else if b.isFirstResponder {
            b.text = "-"
        } else if c.isFirstResponder {
            c.text = "-"
        } else if d.isFirstResponder {
            d.text = "-"
        }
    }
    @IBOutlet weak var a: UITextField!
    @IBOutlet weak var b: UITextField!
    @IBOutlet weak var c: UITextField!
    @IBOutlet weak var d: UITextField!
    @IBOutlet weak var x1: UILabel!
    @IBOutlet weak var x2: UILabel!
    @IBOutlet weak var x3: UILabel!
    @IBAction func Calc(_ sender: Any) {
        Calculate()
    }
    @objc func Calculate() {
        guard let checkValueA = a.text , !checkValueA.isEmpty else {
            alertMessage(alertText: "Enter (a) value")
            return
        }
        guard let checkValueB = b.text , !checkValueB.isEmpty else {
            alertMessage(alertText: "Enter (b) value")
            return
        }
        guard let checkValueC = c.text , !checkValueC.isEmpty else {
            alertMessage(alertText: "Enter (c) value")
            return
        }
        guard let checkValueD = d.text , !checkValueD.isEmpty else {
            alertMessage(alertText: "Enter (d) value")
            return
        }
        let CuAd = Double(a.text!)
        if CuAd == nil {
            alertMessage(alertText: "The Application accepts English numbers only!")
            return
        } else if CuAd == 0 {
            alertMessage(alertText: "In Cubic Equations (a) should not be (0)")
            return
        }
        let CuBda = Double(b.text!)
        if CuBda == nil {
            alertMessage(alertText: "The Application accepts English numbers only!")
            return
        }
        let CuCda = Double(c.text!)
        if CuCda == nil {
            alertMessage(alertText: "The Application accepts English numbers only!")
            return
        }
        let CuDda = Double(d.text!)
        if CuDda == nil {
            alertMessage(alertText: "The Application accepts English numbers only!")
            return
        }
        let CuBd = CuBda! / CuAd!
        let CuCd = CuCda! / CuAd!
        let CuDd = CuDda! / CuAd!
        let CuAA = (1/3) * ((3 * CuCd) - (pow(CuBd, 2)))
        let CuBb = (2 * (pow(CuBd, 3)))
        let CuBc = (9 * CuBd * CuCd)
        let CuBB = (1/27) * ( CuBb - CuBc + 27 * CuDd)
        let CuCosP1 = (pow(CuBB, 2) / 4) / (-1 * pow(CuAA, 3) / 27)
        let Culli = -1 * CuAA / 3
        let CuCosP2 = sqrt(CuCosP1)
        let CuCos = acos(CuCosP2)
        let CuL = 2 * sqrt(Double(Culli))
        let CuM1 = CuL * cos(CuCos / 3)
        let CuM2 = CuL * cos((CuCos / 3) + (120 * (3.14159265359 / 180)))
        let CuM3 = CuL * cos((CuCos / 3) + (240 * (3.14159265359 / 180)))
        let CuXx1 = CuM1 - (CuBd / 3)
        let CuXx2 = CuM2 - (CuBd / 3)
        let CuXx3 = CuM3 - (CuBd / 3)
        let CuXX1 = round(SETTINGS * CuXx1)/SETTINGS
        let CuXX2 = round(SETTINGS * CuXx2)/SETTINGS
        let CuXX3 = round(SETTINGS * CuXx3)/SETTINGS
        if CuXx1.isNaN {
            x1.text = "X1 has No real Number"
        } else {
            x1.text = "X1 = \(CuXX1)"
        }
        if CuXx2.isNaN {
            x2.text = "X2 has No real Number"
        } else {
            x2.text = "X2 = \(CuXX2)"
        }
        if CuXx3.isNaN {
            x3.text = "X3 has No real Number"
        } else {
            x3.text = "X3 = \(CuXX3)"
        }
        self.view.endEditing(true)
    }
}

import UIKit
class SlopeVC: SupportiveFunc {
    var clearReference = false
    @IBOutlet weak var backGroundImage: UIImageView!
    @IBOutlet weak var ButtonHide: UIButton!
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
        Run.inputAccessoryView = toolBar
        Rise.inputAccessoryView = toolBar
        Length.inputAccessoryView = toolBar
        SlopeP.inputAccessoryView = toolBar
        SlopeR.inputAccessoryView = toolBar
    }
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var Run: UITextField!
    @IBOutlet weak var Rise: UITextField!
    @IBOutlet weak var Length: UITextField!
    @IBOutlet weak var SlopeP: UITextField!
    @IBOutlet weak var SlopeR: UITextField!
    @IBAction func runEdited(_ sender: Any) {
        clearCells()
        clearWhileTyping()
    }
    @IBAction func riseEdited(_ sender: Any) {
        clearCells()
        clearWhileTyping()
    }
    @IBAction func lengthEdited(_ sender: Any) {
        clearCells()
        clearWhileTyping()
    }
    @IBAction func slopeEdited(_ sender: Any) {
        clearCells()
        clearWhileTyping()
        let xx2 = Double(SlopeR.text!)
        if xx2 != nil {
            messageLabel.text = "Filling one of Slope fields is enough!"
            SlopeR.text = ""
        }
    }
    @IBAction func slopeREdited(_ sender: Any) {
        clearCells()
        clearWhileTyping()
        let xx1 = Double(SlopeP.text!)
        if xx1 != nil {
            messageLabel.text = "Filling one of Slope fields is enough!"
            SlopeP.text = ""
        }
    }
    func clearCells() {
        if clearReference {
            Run.text = ""
            Rise.text = ""
            Length.text = ""
            SlopeP.text = ""
            SlopeR.text = ""
            clearReference = false
        }
    }
    func clearWhileTyping() {
        let run = Double(Run.text!)
        let rise = Double(Rise.text!)
        let length = Double(Length.text!)
        let slopePx = Double(SlopeP.text!)
        let slopeRx = Double(SlopeR.text!)
        var checkFields = 0
        if run != nil {
            checkFields = checkFields + 1
        }
        if rise != nil {
            checkFields = checkFields + 1
        }
        if length != nil {
            checkFields = checkFields + 1
        }
        if slopePx != nil {
            checkFields = checkFields + 1
        }
        if slopeRx != nil {
            checkFields = checkFields + 1
        }
        if checkFields > 1 {
            Run.text = ""
            Rise.text = ""
            Length.text = ""
            SlopeP.text = ""
            SlopeR.text = ""
            messageLabel.text = "Fill no more than two Fields at a time!"
        }
    }
    @IBAction func Calc(_ sender: Any) {
        Calculate()
    }
    @objc func Calculate() {
        let run = Double(Run.text!)
        let rise = Double(Rise.text!)
        let length = Double(Length.text!)
        let slopePx = Double(SlopeP.text!)
        let slopeRx = Double(SlopeR.text!)
        if run != nil && rise != nil {
            let slopeP = rise! / run! * 100
            let slopeR = run! / rise!
            let length = sqrt(rise! * rise! + run! * run!)
            let slopePP = round(SETTINGS * slopeP) / SETTINGS
            let slopeRR = round(SETTINGS * slopeR) / SETTINGS
            let lengthR = round(SETTINGS * length) / SETTINGS
            Length.text = "\(lengthR)"
            SlopeP.text = "\(slopePP)"
            SlopeR.text = "\(slopeRR)"
        } else if run != nil && length != nil {
            if run! >= length! {
                alertMessage(alertText: "(Run) cannot be larger or equal to (Length)!")
                return
            }
            let rise1 = sqrt(length! * length! - run! * run!)
            let slopeP = rise1 / run! * 100
            let slopeR = run! / rise1
            let slopePP = round(SETTINGS * slopeP) / SETTINGS
            let slopeRR = round(SETTINGS * slopeR) / SETTINGS
            let riseR = round(SETTINGS * rise1) / SETTINGS
            Rise.text = "\(riseR)"
            SlopeP.text = "\(slopePP)"
            SlopeR.text = "\(slopeRR)"
        }  else if length != nil && rise != nil {
            if rise! >= length! {
                alertMessage(alertText: "(Rise) cannot be larger or equal to (Length)!")
                return
            }
            let run1 = sqrt(length! * length! - rise! * rise!)
            let slopeP = rise! / run1 * 100
            let slopeR = run1 / rise!
            let slopePP = round(SETTINGS * slopeP) / SETTINGS
            let slopeRR = round(SETTINGS * slopeR) / SETTINGS
            let runR = round(SETTINGS * run1) / SETTINGS
            Run.text = "\(runR)"
            SlopeP.text = "\(slopePP)"
            SlopeR.text = "\(slopeRR)"
        }  else if run != nil && slopePx != nil {
            let rise1 = slopePx! * run! / 100
            let length1 = sqrt(run! * run! + rise1 * rise1)
            let slopeR = run! / rise1
            let riseRR = round(SETTINGS * rise1) / SETTINGS
            let slopeRR = round(SETTINGS * slopeR) / SETTINGS
            let lengthRR = round(SETTINGS * length1) / SETTINGS
            Rise.text = "\(riseRR)"
            SlopeR.text = "\(slopeRR)"
            Length.text = "\(lengthRR)"
        }  else if rise != nil && slopePx != nil {
            let run1 = rise! * 100 / slopePx!
            let length1 = sqrt(run1 * run1 + rise! * rise!)
            let slopeR = run1 / rise!
            let runRR = round(SETTINGS * run1) / SETTINGS
            let slopeRR = round(SETTINGS * slopeR) / SETTINGS
            let lengthRR = round(SETTINGS * length1) / SETTINGS
            Run.text = "\(runRR)"
            SlopeR.text = "\(slopeRR)"
            Length.text = "\(lengthRR)"
        }  else if length != nil && slopePx != nil {
            let slopeR = 1 / slopePx! * 100
            let angle = atan(slopePx! / 100)
            let rise1 = length! * sin(angle)
            let run1 = length! * cos(angle)
            let runRR = round(SETTINGS * run1) / SETTINGS
            let slopeRR = round(SETTINGS * slopeR) / SETTINGS
            let riseRR = round(SETTINGS * rise1) / SETTINGS
            Run.text = "\(runRR)"
            SlopeR.text = "\(slopeRR)"
            Rise.text = "\(riseRR)"
        }  else if run != nil && slopeRx != nil {
            let slopeP = 1 / slopeRx! * 100
            let rise1 = slopeP * run! / 100
            let length1 = sqrt(run! * run! + rise1 * rise1)
            let riseRR = round(SETTINGS * rise1) / SETTINGS
            let slopeRR = round(SETTINGS * slopeP) / SETTINGS
            let lengthRR = round(SETTINGS * length1) / SETTINGS
            Rise.text = "\(riseRR)"
            SlopeP.text = "\(slopeRR)"
            Length.text = "\(lengthRR)"
        }  else if rise != nil && slopeRx != nil {
            let slopeP = 1 / slopeRx! * 100
            let run1 = rise! * 100 / slopeP
            let length1 = sqrt(run1 * run1 + rise! * rise!)
            let runRR = round(SETTINGS * run1) / SETTINGS
            let slopeRR = round(SETTINGS * slopeP) / SETTINGS
            let lengthRR = round(SETTINGS * length1) / SETTINGS
            Run.text = "\(runRR)"
            SlopeP.text = "\(slopeRR)"
            Length.text = "\(lengthRR)"
        }  else if length != nil && slopeRx != nil {
            let slopeP = 1 / slopeRx! * 100
            let angle = atan(slopeP / 100)
            let rise1 = length! * sin(angle)
            let run1 = length! * cos(angle)
            let runRR = round(SETTINGS * run1) / SETTINGS
            let slopeRR = round(SETTINGS * slopeP) / SETTINGS
            let riseRR = round(SETTINGS * rise1) / SETTINGS
            Run.text = "\(runRR)"
            SlopeP.text = "\(slopeRR)"
            Rise.text = "\(riseRR)"
        } else {
            alertMessage(alertText: "It's mandatory to fill at least two fields!")
        }
        Run.resignFirstResponder()
        Rise.resignFirstResponder()
        Length.resignFirstResponder()
        SlopeP.resignFirstResponder()
        SlopeR.resignFirstResponder()
        clearReference = true
        messageLabel.text = ""
    }
    @IBAction func Report(_ sender: Any) {
        backGroundImage.isHidden = true
        ButtonHide.isHidden = true
        ScrnShot()
        ButtonHide.isHidden = false
        backGroundImage.isHidden = false
    }
    func ScrnShot() {
        UIGraphicsBeginImageContext(view.frame.size)
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let sourceImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        let FileShare = [sourceImage!]
        let activityViewController = UIActivityViewController(activityItems: FileShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        self.present(activityViewController, animated: true, completion: nil)
    }
}

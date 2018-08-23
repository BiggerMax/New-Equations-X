import UIKit
class AreaVC: SupportiveFunc {
    @IBOutlet weak var backgroundImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageAreaChanged()
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
        applyMotionEffect(toView: backgroundImage, magnitude: 20)
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        toolBar.barTintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        toolBar.alpha = 0.8
        toolBar.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "⬇︎", style: .done, target: self, action: #selector(self.donePressed))
        let runButton = UIBarButtonItem(title: "=", style: .done, target: self, action: #selector(self.Calculate))
        toolBar.setItems([doneButton, flexibleSpace, runButton], animated: false)
        a_Label.inputAccessoryView = toolBar
        b_Label.inputAccessoryView = toolBar
        c_Label.inputAccessoryView = toolBar
    }
    var defaultAreaText = ""
    func imageAreaChanged() {
        if changeAreaID == "Square" {
            AreaImage.image = #imageLiteral(resourceName: "Areas of 2D shapes-1")
            a_Label.placeholder = "a"
            b_Label.isHidden = true
            c_Label.isHidden = true
        } else if changeAreaID == "Rectangle" {
            AreaImage.image = #imageLiteral(resourceName: "Areas of 2D shapes-2")
            a_Label.placeholder = "a"
            b_Label.placeholder = "b"
            c_Label.isHidden = true
        } else if changeAreaID == "Parallelogram" {
            AreaImage.image = #imageLiteral(resourceName: "Areas of 2D shapes-3")
            a_Label.placeholder = "h"
            b_Label.placeholder = "b"
            c_Label.isHidden = true
        } else if changeAreaID == "Trapezium" {
            AreaImage.image = #imageLiteral(resourceName: "Areas of 2D shapes-4")
            a_Label.placeholder = "a"
            b_Label.placeholder = "b"
            c_Label.placeholder = "h"
        } else if changeAreaID == "Triangle" {
            AreaImage.image = #imageLiteral(resourceName: "Areas of 2D shapes-5")
            a_Label.placeholder = "b"
            b_Label.placeholder = "h"
            c_Label.isHidden = true
        } else if changeAreaID == "Equilateral triangle" {
            AreaImage.image = #imageLiteral(resourceName: "Areas of 2D shapes-6")
            a_Label.placeholder = "b"
            b_Label.isHidden = true
            c_Label.isHidden = true
        } else if changeAreaID == "Pentagon" {
            AreaImage.image = #imageLiteral(resourceName: "Areas of 2D shapes-7")
            a_Label.placeholder = "a"
            b_Label.isHidden = true
            c_Label.isHidden = true
        } else if changeAreaID == "Hexagon" {
            AreaImage.image = #imageLiteral(resourceName: "Areas of 2D shapes-8")
            a_Label.placeholder = "a"
            b_Label.isHidden = true
            c_Label.isHidden = true
        } else if changeAreaID == "Octagon" {
            AreaImage.image = #imageLiteral(resourceName: "Areas of 2D shapes-9")
            a_Label.placeholder = "a"
            b_Label.isHidden = true
            c_Label.isHidden = true
        } else if changeAreaID == "Circle" {
            AreaImage.image = #imageLiteral(resourceName: "Areas of 2D shapes-10")
            a_Label.placeholder = "r"
            b_Label.isHidden = true
            c_Label.isHidden = true
        } else if changeAreaID == "Annulus" {
            AreaImage.image = #imageLiteral(resourceName: "Areas of 2D shapes-11")
            a_Label.placeholder = "R"
            b_Label.placeholder = "r"
            c_Label.isHidden = true
        } else if changeAreaID == "Sector of circle" {
            AreaImage.image = #imageLiteral(resourceName: "Areas of 2D shapes-12")
            a_Label.placeholder = "a"
            b_Label.placeholder = "r"
            c_Label.isHidden = true
        } else if changeAreaID == "Segment of circle" {
            AreaImage.image = #imageLiteral(resourceName: "Areas of 2D shapes-13")
            a_Label.placeholder = "r"
            b_Label.placeholder = "a"
            c_Label.isHidden = true
        } else if changeAreaID == "Ellipse" {
            AreaImage.image = #imageLiteral(resourceName: "Areas of 2D shapes-14")
            a_Label.placeholder = "m"
            b_Label.placeholder = "n"
            c_Label.isHidden = true
        } else if changeAreaID == "Rounded rectangle" {
            AreaImage.image = #imageLiteral(resourceName: "Areas of 2D shapes-15")
            a_Label.placeholder = "a"
            b_Label.placeholder = "b"
            c_Label.placeholder = "r"
        }
    }
    func RFR() {
        a_Label.resignFirstResponder()
        b_Label.resignFirstResponder()
        c_Label.resignFirstResponder()
    }
    @IBOutlet weak var AreaImage: UIImageView!
    @IBOutlet weak var a_Label: UITextField!
    @IBOutlet weak var b_Label: UITextField!
    @IBOutlet weak var c_Label: UITextField!
    @IBOutlet weak var AreaLabel: UILabel!
    @IBAction func CalculateArea(_ sender: Any) {
        Calculate()
    }
    @objc func Calculate() {
        if changeAreaID == "Square" {
            guard !(a_Label.text?.isEmpty)! else {
                alertMessage(alertText: "fill (a) value")
                return
            }
            let aaa = Double(a_Label.text!)
            if aaa == nil {
                alertMessage(alertText: "Enter English Numbers Only!")
                return
            }
            var squareL = pow(aaa!, 2)
            squareL = round(squareL * SETTINGS)/SETTINGS
            AreaLabel.text = "A = \(squareL)"
            RFR()
        } else if changeAreaID == "Rectangle" {
            guard !(a_Label.text?.isEmpty)! else {
                alertMessage(alertText: "fill (a) value")
                return
            }
            guard !(b_Label.text?.isEmpty)! else {
                alertMessage(alertText: "fill (b) value")
                return
            }
            let aaa = Double(a_Label.text!)
            if aaa == nil {
                alertMessage(alertText: "Enter English Numbers Only!")
                return
            }
            let bbb = Double(b_Label.text!)
            if bbb == nil {
                alertMessage(alertText: "Enter English Numbers Only!")
                return
            }
            var rectangleArea = aaa! * bbb!
            rectangleArea = round(rectangleArea * SETTINGS)/SETTINGS
            AreaLabel.text = "A = \(rectangleArea)"
            RFR()
        } else if changeAreaID == "Parallelogram" {
            guard !(a_Label.text?.isEmpty)! else {
                alertMessage(alertText: "fill (h) value")
                return
            }
            guard !(b_Label.text?.isEmpty)! else {
                alertMessage(alertText: "fill (b) value")
                return
            }
            let aaa = Double(a_Label.text!)
            if aaa == nil {
                alertMessage(alertText: "Enter English Numbers Only!")
                return
            }
            let bbb = Double(b_Label.text!)
            if bbb == nil {
                alertMessage(alertText: "Enter English Numbers Only!")
                return
            }
            var parallelogramArea = aaa! * bbb!
            parallelogramArea = round(parallelogramArea * SETTINGS)/SETTINGS
            AreaLabel.text = "A = \(parallelogramArea)"
            RFR()
        } else if changeAreaID == "Trapezium" {
            guard !(a_Label.text?.isEmpty)! else {
                alertMessage(alertText: "fill (a) value")
                return
            }
            guard !(b_Label.text?.isEmpty)! else {
                alertMessage(alertText: "fill (b) value")
                return
            }
            guard !(c_Label.text?.isEmpty)! else {
                alertMessage(alertText: "fill (h) value")
                return
            }
            let aaa = Double(a_Label.text!)
            if aaa == nil {
                alertMessage(alertText: "Enter English Numbers Only!")
                return
            }
            let bbb = Double(b_Label.text!)
            if bbb == nil {
                alertMessage(alertText: "Enter English Numbers Only!")
                return
            }
            let ccc = Double(c_Label.text!)
            if ccc == nil {
                alertMessage(alertText: "Enter English Numbers Only!")
                return
            }
            var trapeziumL = 0.5 * ccc! * (aaa! + bbb!)
            trapeziumL = round(trapeziumL * SETTINGS)/SETTINGS
            AreaLabel.text = "A = \(trapeziumL)"
            RFR()
        } else if changeAreaID == "Triangle" {
            guard !(a_Label.text?.isEmpty)! else {
                alertMessage(alertText: "fill (b) value")
                return
            }
            guard !(b_Label.text?.isEmpty)! else {
                alertMessage(alertText: "fill (h) value")
                return
            }
            let aaa = Double(a_Label.text!)
            if aaa == nil {
                alertMessage(alertText: "Enter English Numbers Only!")
                return
            }
            let bbb = Double(b_Label.text!)
            if bbb == nil {
                alertMessage(alertText: "Enter English Numbers Only!")
                return
            }
            var triangleArea = 0.5 * aaa! * bbb!
            triangleArea = round(triangleArea * SETTINGS)/SETTINGS
            AreaLabel.text = "A = \(triangleArea)"
            RFR()
        } else if changeAreaID == "Equilateral triangle" {
            guard !(a_Label.text?.isEmpty)! else {
                alertMessage(alertText: "fill (b) value")
                return
            }
            let aaa = Double(a_Label.text!)
            if aaa == nil {
                alertMessage(alertText: "Enter English Numbers Only!")
                return
            }
            var equilateralTriangleArea = pow(aaa!, 2) * (0.433012701892219)
            equilateralTriangleArea = round(equilateralTriangleArea * SETTINGS)/SETTINGS
            AreaLabel.text = "A = \(equilateralTriangleArea)"
            RFR()
        } else if changeAreaID == "Pentagon" {
            guard !(a_Label.text?.isEmpty)! else {
                alertMessage(alertText: "fill (a) value")
                return
            }
            let aaa = Double(a_Label.text!)
            if aaa == nil {
                alertMessage(alertText: "Enter English Numbers Only!")
                return
            }
            var pentagonArea = pow(aaa!, 2) * 1.720477400588967
            pentagonArea = round(pentagonArea * SETTINGS)/SETTINGS
            AreaLabel.text = "A = \(pentagonArea)"
            RFR()
        } else if changeAreaID == "Hexagon" {
            guard !(a_Label.text?.isEmpty)! else {
                alertMessage(alertText: "fill (a) value")
                return
            }
            let aaa = Double(a_Label.text!)
            if aaa == nil {
                alertMessage(alertText: "Enter English Numbers Only!")
                return
            }
            var hexagonA = pow(aaa!, 2) * 2.598076211353316
            hexagonA = round(hexagonA * SETTINGS)/SETTINGS
            AreaLabel.text = "A = \(hexagonA)"
            RFR()
        } else if changeAreaID == "Octagon" {
            guard !(a_Label.text?.isEmpty)! else {
                alertMessage(alertText: "fill (a) value")
                return
            }
            let aaa = Double(a_Label.text!)
            if aaa == nil {
                alertMessage(alertText: "Enter English Numbers Only!")
                return
            }
            var octagonA = 4.82842712474619 * pow(aaa!, 2)
            octagonA = round(octagonA * SETTINGS)/SETTINGS
            AreaLabel.text = "A = \(octagonA)"
            RFR()
        } else if changeAreaID == "Circle" {
            guard !(a_Label.text?.isEmpty)! else {
                alertMessage(alertText: "fill (r) value")
                return
            }
            let aaa = Double(a_Label.text!)
            if aaa == nil {
                alertMessage(alertText: "Enter English Numbers Only!")
                return
            }
            var circleA = pow(aaa!, 2) * 3.14159265359
            circleA = round(circleA * SETTINGS)/SETTINGS
            AreaLabel.text = "A = \(circleA)"
            RFR()
        } else if changeAreaID == "Annulus" {
            guard !(a_Label.text?.isEmpty)! else {
                alertMessage(alertText: "fill (R) value")
                return
            }
            guard !(b_Label.text?.isEmpty)! else {
                alertMessage(alertText: "fill (r) value")
                return
            }
            let aaa = Double(a_Label.text!)
            if aaa == nil {
                alertMessage(alertText: "Enter English Numbers Only!")
                return
            }
            let bbb = Double(b_Label.text!)
            if bbb == nil {
                alertMessage(alertText: "Enter English Numbers Only!")
                return
            }
            if bbb! > aaa! {
                alertMessage(alertText: "(R) value must be greater than (r) value!")
                return
            } else {
                var annulusL = pow(aaa!, 2) - pow(bbb!, 2)
                annulusL = annulusL * Double.pi
                annulusL = round(annulusL * SETTINGS)/SETTINGS
                AreaLabel.text = "A = \(annulusL)"
                RFR()
            }
        } else if changeAreaID == "Sector of circle" {
            guard !(a_Label.text?.isEmpty)! else {
                alertMessage(alertText: "fill (a) value")
                return
            }
            guard !(b_Label.text?.isEmpty)! else {
                alertMessage(alertText: "fill (r) value")
                return
            }
            let aaa = Double(a_Label.text!)
            if aaa == nil {
                alertMessage(alertText: "Enter English Numbers Only!")
                return
            }
            let bbb = Double(b_Label.text!)
            if bbb == nil {
                alertMessage(alertText: "Enter English Numbers Only!")
                return
            }
            var secOfCircleL = pow(bbb!, 2) * Double.pi
            secOfCircleL = secOfCircleL * aaa! / 360
            secOfCircleL = round(secOfCircleL * SETTINGS)/SETTINGS
            AreaLabel.text = "A = \(secOfCircleL)"
            RFR()
        } else if changeAreaID == "Segment of circle" {
            guard !(a_Label.text?.isEmpty)! else {
                alertMessage(alertText: "fill (r) value")
                return
            }
            guard !(b_Label.text?.isEmpty)! else {
                alertMessage(alertText: "fill (a) value")
                return
            }
            let aaa = Double(a_Label.text!)
            if aaa == nil {
                alertMessage(alertText: "Enter English Numbers Only!")
                return
            }
            let bbb = Double(b_Label.text!)
            if bbb == nil {
                alertMessage(alertText: "Enter English Numbers Only!")
                return
            }
            var segOfCircleL = 0.5 * pow(aaa!, 2) * ((bbb! * Double.pi / 180) - sin(bbb! * Double.pi / 180))
            segOfCircleL = round(segOfCircleL * SETTINGS)/SETTINGS
            AreaLabel.text = "A = \(segOfCircleL)"
            RFR()
        } else if changeAreaID == "Ellipse" {
            guard !(a_Label.text?.isEmpty)! else {
                alertMessage(alertText: "fill (m) value")
                return
            }
            guard !(b_Label.text?.isEmpty)! else {
                alertMessage(alertText: "fill (n) value")
                return
            }
            let aaa = Double(a_Label.text!)
            if aaa == nil {
                alertMessage(alertText: "Enter English Numbers Only!")
                return
            }
            let bbb = Double(b_Label.text!)
            if bbb == nil {
                alertMessage(alertText: "Enter English Numbers Only!")
                return
            }
            var ellipseL = aaa! * bbb! * 3.141592653589793
            ellipseL = round(ellipseL * SETTINGS)/SETTINGS
            AreaLabel.text = "A = \(ellipseL)"
            RFR()
        } else if changeAreaID == "Rounded rectangle" {
            guard !(a_Label.text?.isEmpty)! else {
                alertMessage(alertText: "fill (a) value")
                return
            }
            guard !(b_Label.text?.isEmpty)! else {
                alertMessage(alertText: "fill (b) value")
                return
            }
            guard !(c_Label.text?.isEmpty)! else {
                alertMessage(alertText: "fill (r) value")
                return
            }
            let aaa = Double(a_Label.text!)
            if aaa == nil {
                alertMessage(alertText: "Enter English Numbers Only!")
                return
            }
            let bbb = Double(b_Label.text!)
            if bbb == nil {
                alertMessage(alertText: "Enter English Numbers Only!")
                return
            }
            let ccc = Double(c_Label.text!)
            if ccc == nil {
                alertMessage(alertText: "Enter English Numbers Only!")
                return
            }
            let ax = aaa! / 2
            let bx = bbb! / 2
            if ccc! > ax {
                alertMessage(alertText: "(r) cannot be larger than (a/2) (Wrong proportion!)")
                return
            }
            if ccc! > bx {
                alertMessage(alertText: "(r) cannot be larger than (b/2) (Wrong proportion!)")
                return
            }
            var RRec = (aaa! * bbb!) - (pow(ccc!, 2) * (4 - Double.pi))
            RRec = round(RRec * SETTINGS) / SETTINGS
            AreaLabel.text = "A = \(RRec)"
            RFR()
        }
    }
}

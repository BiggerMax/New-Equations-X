import UIKit
class VolumeVC: SupportiveFunc {
    @IBOutlet weak var backgroundImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageChanged()
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
    func imageChanged() {
        if changeID == "Cube" {
            VolumeImageView.image = #imageLiteral(resourceName: "Areas of 3D shapes-1")
            a_Label.placeholder = "a"
            b_Label.isHidden = true
            c_Label.isHidden = true
        } else if changeID == "Cuboid" {
            VolumeImageView.image = #imageLiteral(resourceName: "Areas of 3D shapes-2")
            a_Label.placeholder = "a"
            b_Label.placeholder = "b"
            c_Label.placeholder = "c"
        } else if changeID == "Parallelepiped" {
            VolumeImageView.image = #imageLiteral(resourceName: "Areas of 3D shapes-3")
            a_Label.placeholder = "h"
            b_Label.placeholder = "b"
            c_Label.placeholder = "c"
        } else if changeID == "Pyramid" {
            VolumeImageView.image = #imageLiteral(resourceName: "Areas of 3D shapes-4")
            a_Label.placeholder = "a"
            b_Label.placeholder = "b"
            c_Label.placeholder = "h"
        } else if changeID == "Frustum of a pyramid" {
            VolumeImageView.image = #imageLiteral(resourceName: "Areas of 3D shapes-5")
            a_Label.placeholder = "h"
            b_Label.placeholder = "A1"
            c_Label.placeholder = "A2"
        } else if changeID == "Cylinder" {
            VolumeImageView.image = #imageLiteral(resourceName: "Areas of 3D shapes-6")
            a_Label.placeholder = "r"
            b_Label.placeholder = "h"
            c_Label.isHidden = true
        } else if changeID == "Hollow Cylinder" {
            VolumeImageView.image = #imageLiteral(resourceName: "Areas of 3D shapes-7")
            a_Label.placeholder = "R"
            b_Label.placeholder = "r"
            c_Label.placeholder = "h"
        } else if changeID == "Cone" {
            VolumeImageView.image = #imageLiteral(resourceName: "Areas of 3D shapes-8")
            a_Label.placeholder = "r"
            b_Label.placeholder = "h"
            c_Label.isHidden = true
        } else if changeID == "Frustum of a cone" {
            VolumeImageView.image = #imageLiteral(resourceName: "Areas of 3D shapes-9")
            a_Label.placeholder = "R"
            b_Label.placeholder = "r"
            c_Label.placeholder = "h"
        } else if changeID == "Sphere" {
            VolumeImageView.image = #imageLiteral(resourceName: "Areas of 3D shapes-10")
            a_Label.placeholder = "r"
            b_Label.isHidden = true
            c_Label.isHidden = true
        } else if changeID == "Zone of a sphere" {
            VolumeImageView.image = #imageLiteral(resourceName: "Areas of 3D shapes-11")
            a_Label.placeholder = "h"
            b_Label.placeholder = "x"
            c_Label.placeholder = "r"
        } else if changeID == "Segment of a sphere" {
            VolumeImageView.image = #imageLiteral(resourceName: "Areas of 3D shapes-12")
            a_Label.placeholder = "r"
            b_Label.placeholder = "h"
            c_Label.isHidden = true
        } else if changeID == "Sector of a sphere" {
            VolumeImageView.image = #imageLiteral(resourceName: "Areas of 3D shapes-13")
            a_Label.placeholder = "r"
            b_Label.placeholder = "h"
            c_Label.isHidden = true
        } else if changeID == "Sphere with cylinder" {
            VolumeImageView.image = #imageLiteral(resourceName: "Areas of 3D shapes-14")
            a_Label.placeholder = "h"
            b_Label.isHidden = true
            c_Label.isHidden = true
        } else if changeID == "Torus" {
            VolumeImageView.image = #imageLiteral(resourceName: "Areas of 3D shapes-15")
            a_Label.placeholder = "R"
            b_Label.placeholder = "r"
            c_Label.isHidden = true
        } else if changeID == "Sliced Cylinder" {
            VolumeImageView.image = #imageLiteral(resourceName: "Areas of 3D shapes-16")
            a_Label.placeholder = "r"
            b_Label.placeholder = "h"
            c_Label.isHidden = true
        } else if changeID == "Ungula" {
            VolumeImageView.image = #imageLiteral(resourceName: "Areas of 3D shapes-17")
            a_Label.placeholder = "r"
            b_Label.placeholder = "h"
            c_Label.isHidden = true
        } else if changeID == "Barrel" {
            VolumeImageView.image = #imageLiteral(resourceName: "Areas of 3D shapes-18")
            a_Label.placeholder = "h"
            b_Label.placeholder = "D"
            c_Label.placeholder = "d"
        }
    }
    func RFR() {
        a_Label.resignFirstResponder()
        b_Label.resignFirstResponder()
        c_Label.resignFirstResponder()
    }
    @IBOutlet weak var VolumeImageView: UIImageView!
    @IBOutlet weak var a_Label: UITextField!
    @IBOutlet weak var b_Label: UITextField!
    @IBOutlet weak var c_Label: UITextField!
    @IBOutlet weak var VolumeLabel: UILabel!
    @IBAction func CalculateVolume(_ sender: Any) {
        Calculate()
    }
    @objc func Calculate() {
        if changeID == "Cube" {
            guard !(a_Label.text?.isEmpty)! else {
                alertMessage(alertText: "fill (a) value")
                return
            }
            let aaa = Double(a_Label.text!)
            if aaa == nil {
                alertMessage(alertText: "Enter English Numbers Only!")
                return
            }
            var cubV = pow(aaa!, 3)
            cubV = round(cubV * SETTINGS)/SETTINGS
            VolumeLabel.text = "V = \(cubV)"
            RFR()
        } else if changeID == "Cuboid" {
            guard !(a_Label.text?.isEmpty)! else {
                alertMessage(alertText: "fill (a) value")
                return
            }
            guard !(b_Label.text?.isEmpty)! else {
                alertMessage(alertText: "fill (b) value")
                return
            }
            guard !(c_Label.text?.isEmpty)! else {
                alertMessage(alertText: "fill (c) value")
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
            var cuboidV = aaa! * bbb!
            cuboidV = cuboidV * ccc!
            cuboidV = round(cuboidV * SETTINGS)/SETTINGS
            VolumeLabel.text = "V = \(cuboidV)"
            RFR()
        } else if changeID == "Parallelepiped" {
            guard !(a_Label.text?.isEmpty)! else {
                alertMessage(alertText: "fill (h) value")
                return
            }
            guard !(b_Label.text?.isEmpty)! else {
                alertMessage(alertText: "fill (b) value")
                return
            }
            guard !(c_Label.text?.isEmpty)! else {
                alertMessage(alertText: "fill (c) value")
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
            var ParallelepipedV = aaa! * bbb!
            ParallelepipedV = ParallelepipedV * ccc!
            ParallelepipedV = round(ParallelepipedV * SETTINGS)/SETTINGS
            VolumeLabel.text = "V = \(ParallelepipedV)"
            RFR()
        } else if changeID == "Pyramid" {
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
            var PyrmidV = aaa! * bbb! * ccc! / 3
            PyrmidV = round(PyrmidV * SETTINGS)/SETTINGS
            VolumeLabel.text = "V = \(PyrmidV)"
            RFR()
        } else if changeID == "Frustum of a pyramid" {
            guard !(a_Label.text?.isEmpty)! else {
                alertMessage(alertText: "fill (h) value")
                return
            }
            guard !(b_Label.text?.isEmpty)! else {
                alertMessage(alertText: "fill (A1) value")
                return
            }
            guard !(c_Label.text?.isEmpty)! else {
                alertMessage(alertText: "fill (A2) value")
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
            if ccc! > bbb! {
                alertMessage(alertText: "A1 should be greater than A2!")
                return
            }
            let sqrtAA = sqrt(bbb! * ccc!)
            var FOPV = bbb! + ccc! + sqrtAA
            FOPV = FOPV * aaa! / 3
            FOPV = round(FOPV * SETTINGS)/SETTINGS
            VolumeLabel.text = "V = \(FOPV)"
            RFR()
        } else if changeID == "Cylinder" {
            guard !(a_Label.text?.isEmpty)! else {
                alertMessage(alertText: "fill (r) value")
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
            var cylenderV = pow(aaa!, 2)
            cylenderV = cylenderV * bbb!
            cylenderV = cylenderV * Double.pi
            cylenderV = round(cylenderV * SETTINGS)/SETTINGS
            VolumeLabel.text = "V = \(cylenderV)"
            RFR()
        } else if changeID == "Hollow Cylinder" {
            guard !(a_Label.text?.isEmpty)! else {
                alertMessage(alertText: "fill (R) value")
                return
            }
            guard !(b_Label.text?.isEmpty)! else {
                alertMessage(alertText: "fill (r) value")
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
            if aaa! < bbb! {
                alertMessage(alertText: "R should be greater than r")
                return
            }
            let Dpow = pow(aaa!, 2)
            let dPow = pow(bbb!, 2)
            var HolloCylinder = (Dpow - dPow) * Double.pi * ccc!
            HolloCylinder = round(HolloCylinder * SETTINGS)/SETTINGS
            VolumeLabel.text = "V = \(HolloCylinder)"
            RFR()
        } else if changeID == "Cone" {
            guard !(a_Label.text?.isEmpty)! else {
                alertMessage(alertText: "fill (r) value")
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
            let rPow = pow(aaa!, 2)
            var coneV = rPow * bbb! * Double.pi / 3
            coneV = round(coneV * SETTINGS)/SETTINGS
            VolumeLabel.text = "V = \(coneV)"
            RFR()
        } else if changeID == "Frustum of a cone" {
            guard !(a_Label.text?.isEmpty)! else {
                alertMessage(alertText: "fill (R) value")
                return
            }
            guard !(b_Label.text?.isEmpty)! else {
                alertMessage(alertText: "fill (r) value")
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
            if aaa! < bbb! {
                alertMessage(alertText: "R should be greater than r!")
                return
            }
            let powD = pow(aaa!, 2)
            let powd = pow(bbb!, 2)
            let Dtimed = aaa! * bbb!
            var FOConeV = powD + powd + Dtimed
            FOConeV = FOConeV * ccc! * Double.pi / 3
            FOConeV = round(FOConeV * SETTINGS)/SETTINGS
            VolumeLabel.text = "V = \(FOConeV)"
            RFR()
        } else if changeID == "Sphere" {
            guard !(a_Label.text?.isEmpty)! else {
                alertMessage(alertText: "fill (r) value")
                return
            }
            let aaa = Double(a_Label.text!)
            if aaa == nil {
                alertMessage(alertText: "Enter English Numbers Only!")
                return
            }
            var sphereV = pow(aaa!, 3) * Double.pi
            sphereV = sphereV * 4 / 3
            sphereV = round(sphereV * SETTINGS)/SETTINGS
            VolumeLabel.text = "V = \(sphereV)"
            RFR()
        } else if changeID == "Zone of a sphere" {
            guard !(a_Label.text?.isEmpty)! else {
                alertMessage(alertText: "fill (h) value")
                return
            }
            guard !(b_Label.text?.isEmpty)! else {
                alertMessage(alertText: "fill (x) value")
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
            if bbb! < ccc! {
                alertMessage(alertText: "x should be greater than r!")
                return
            }
            let rPow = pow(ccc!, 2) * 3
            let xPow = pow(bbb!, 2) * 3
            let hPow = pow(aaa!, 2)
            var ZOSphere = rPow + xPow + hPow
            ZOSphere = ZOSphere * aaa! * Double.pi / 6
            ZOSphere = round(ZOSphere * SETTINGS)/SETTINGS
            VolumeLabel.text = "V = \(ZOSphere)"
            RFR()
        } else if changeID == "Segment of a sphere" {
            guard !(a_Label.text?.isEmpty)! else {
                alertMessage(alertText: "fill (r) value")
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
            let dPow = pow(aaa!, 2) * 3
            let hPow = pow(bbb!, 2)
            var SOSphere = dPow + hPow
            SOSphere = SOSphere * bbb! * Double.pi / 6
            SOSphere = round(SOSphere * SETTINGS)/SETTINGS
            VolumeLabel.text = "V = \(SOSphere)"
            RFR()
        } else if changeID == "Sector of a sphere" {
            guard !(a_Label.text?.isEmpty)! else {
                alertMessage(alertText: "fill (r) value")
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
            var SOSphere = pow(aaa!, 2)
            SOSphere = SOSphere * bbb! * Double.pi * 2
            SOSphere = SOSphere / 3
            SOSphere = round(SOSphere * SETTINGS)/SETTINGS
            VolumeLabel.text = "V = \(SOSphere)"
            RFR()
        } else if changeID == "Sphere with cylinder" {
            guard !(a_Label.text?.isEmpty)! else {
                alertMessage(alertText: "fill (h) value")
                return
            }
            let aaa = Double(a_Label.text!)
            if aaa == nil {
                alertMessage(alertText: "Enter English Numbers Only!")
                return
            }
            var SWCylinder = pow(aaa!, 3)
            SWCylinder = SWCylinder * Double.pi
            SWCylinder = SWCylinder / 6
            SWCylinder = round(SWCylinder * SETTINGS)/SETTINGS
            VolumeLabel.text = "V = \(SWCylinder)"
            RFR()
        } else if changeID == "Torus" {
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
            if aaa! < bbb! {
                alertMessage(alertText: "R should be greater than r!")
                return
            }
            var SW2Cone = pow(bbb!, 2)
            SW2Cone = (Double.pi * SW2Cone) * (2 * Double.pi * aaa!)
            SW2Cone = round(SW2Cone * SETTINGS)/SETTINGS
            VolumeLabel.text = "V = \(SW2Cone)"
            RFR()
        } else if changeID == "Sliced Cylinder" {
            guard !(a_Label.text?.isEmpty)! else {
                alertMessage(alertText: "fill (r) value")
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
            var SliCylinder = pow(aaa!, 2)
            SliCylinder = SliCylinder * bbb! * Double.pi
            SliCylinder = round(SliCylinder * SETTINGS)/SETTINGS
            VolumeLabel.text = "V = \(SliCylinder)"
            RFR()
        } else if changeID == "Ungula" {
            guard !(a_Label.text?.isEmpty)! else {
                alertMessage(alertText: "fill (r) value")
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
            var urgula = pow(aaa!, 2)
            urgula = urgula * bbb!
            urgula = (urgula * 2) / 3
            urgula = round(urgula * SETTINGS)/SETTINGS
            VolumeLabel.text = "V = \(urgula)"
            RFR()
        } else if changeID == "Barrel" {
            guard !(a_Label.text?.isEmpty)! else {
                alertMessage(alertText: "fill (h) value")
                return
            }
            guard !(b_Label.text?.isEmpty)! else {
                alertMessage(alertText: "fill (D) value")
                return
            }
            guard !(c_Label.text?.isEmpty)! else {
                alertMessage(alertText: "fill (d) value")
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
            if bbb! < ccc! {
                alertMessage(alertText: "D should be greater than d!")
                return
            }
            if aaa! > bbb! {
                alertMessage(alertText: "D should be greater than h!")
                return
            }
            let powD = pow(bbb!, 2) * 2
            let powd = pow(ccc!, 2)
            var barrel = powD + powd
            barrel = barrel * aaa! * Double.pi
            barrel = barrel / 12
            barrel = round(barrel * SETTINGS)/SETTINGS
            VolumeLabel.text = "V = \(barrel)"
            RFR()
        }
    }
}

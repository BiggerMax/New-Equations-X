import UIKit
class SettingsVC: SupportiveFunc {
    var Value = 2
    override func viewDidLoad() {
        super.viewDidLoad()
        if let rounding = UserDefaults.standard.value(forKey: "rounding") as? Int {
            Value = rounding
            valuFunc()
        }
        SkiderValue.setValue(Float(Value), animated: true)
        applyMotionEffect(toView: BackGround, magnitude: 20)
    }
    func valuFunc() {
        if Value == 0 {
            SliderValue.text = "0"
        } else if Value == 1 {
            SliderValue.text = "0.0"
        } else if Value == 2 {
            SliderValue.text = "0.00"
        } else if Value == 3 {
            SliderValue.text = "0.000"
        } else if Value == 4 {
            SliderValue.text = "0.0000"
        }
    }
    @IBOutlet weak var BackGround: UIImageView!
    @IBOutlet weak var SliderValue: UILabel!
    @IBOutlet weak var SkiderValue: UISlider!
    @IBAction func Slider(_ sender: UISlider) {
        Value = Int(sender.value)
        valuFunc()
        UserDefaults.standard.set(Value, forKey: "rounding")
        SkiderValue.setValue(Float(Value), animated: true)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
    }
    @IBAction func RateOnAppStore(_ sender: Any) {
        let appDelegate = AppDelegate()
        appDelegate.requestReview()
    }
}

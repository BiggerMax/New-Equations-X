import UIKit
var SETTINGS = 100.0
var changeAreaID = ""
var changeID = ""
class MainVC: SupportiveFunc {
    @IBOutlet weak var backgroundImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        applyMotionEffect(toView: backgroundImage, magnitude: 20)
    }
}

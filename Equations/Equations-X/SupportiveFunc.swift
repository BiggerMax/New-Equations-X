import Foundation
import UIKit
class SupportiveFunc: UIViewController {
    func alertMessage(alertText: String) {
        let alert:UIAlertController = UIAlertController(title: nil, message: alertText, preferredStyle: UIAlertControllerStyle.alert)
        let action:UIAlertAction = UIAlertAction(title: "Close", style: UIAlertActionStyle.default) { (a:UIAlertAction) -> Void in
        }
        alert.addAction(action)
        self.present(alert, animated: true) { () -> Void in
        }
    }
    @objc func donePressed() {
        self.view.endEditing(true)
    }
    func applyMotionEffect (toView view:UIView, magnitude:Float) {
        let xMotion = UIInterpolatingMotionEffect(keyPath: "center.x", type: .tiltAlongHorizontalAxis)
        xMotion.minimumRelativeValue = -magnitude
        xMotion.maximumRelativeValue = magnitude
        let yMotion = UIInterpolatingMotionEffect(keyPath: "center.y", type: .tiltAlongVerticalAxis)
        yMotion.minimumRelativeValue = -magnitude
        yMotion.maximumRelativeValue = magnitude
        let group = UIMotionEffectGroup()
        group.motionEffects = [xMotion, yMotion]
        view.addMotionEffect(group)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

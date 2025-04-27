import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground()
    }
    
    @IBAction func changeBackgroundColor(_ sender: UIButton) {
        UIView.animate(withDuration: 0.2,
                       animations: {
                           sender.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
                       },
                       completion: { _ in
                           UIView.animate(withDuration: 0.2) {
                               sender.transform = CGAffineTransform.identity
                           }
                       })
    
    let gradient = CAGradientLayer()
    gradient.frame = view.bounds
    
    let color1 = randomColor().cgColor
    let color2 = randomColor().cgColor
    
    gradient.colors = [color1, color2]
    gradient.startPoint = CGPoint(x: 0, y: 0)
    gradient.endPoint = CGPoint(x: 1, y: 1)
    
    // Remove old gradients
    view.layer.sublayers?.removeAll(where: { $0 is CAGradientLayer })
    
    // Smooth fade transition
    let transition = CATransition()
    transition.type = .fade
    transition.duration = 0.5
    view.layer.add(transition, forKey: nil)
    
    view.layer.insertSublayer(gradient, at: 0)
}
    
    func setGradientBackground() {
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [
            UIColor.black.cgColor,
            UIColor.brown.cgColor,
            UIColor(red: 0.9, green: 0.8, blue: 0.7, alpha: 1.0).cgColor
        ]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        view.layer.insertSublayer(gradient, at: 0)
    }
    
func randomColor() -> UIColor {
    let red = CGFloat.random(in: 0...1)
    let green = CGFloat.random(in: 0...1)
    let blue = CGFloat.random(in: 0...1)
    return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
}
}

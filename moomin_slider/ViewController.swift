//
//  ViewController.swift
//  moomin_slider
//
//  Created by Yang Nina on 2021/4/2.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var heart: UIImageView!
    @IBOutlet var bloosom: [UIImageView]!
    @IBOutlet weak var femaleImageView: UIImageView!
    @IBOutlet weak var manImageView: UIImageView!
    @IBOutlet weak var distanceSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //漸層
        let gradientLayer = CAGradientLayer()
        //漸層大小與ViewController一樣大
        gradientLayer.frame = view.bounds
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
      
        gradientLayer.colors = [
            UIColor(red: 211/255, green: 149/255, blue: 155/255, alpha: 0.6).cgColor, UIColor(red: 191/255, green: 230/255, blue: 186/255, alpha: 0.6).cgColor]
        
        //漸層加在最底層
        view.layer.insertSublayer(gradientLayer, at: 0)
        
        heart.alpha = 0
    }

    @IBAction func changeSlider(_ sender: UISlider) {
        let speed = sender.value * 0.43
        femaleImageView.frame.origin.x = CGFloat(134 + speed)
        manImageView.frame.origin.x = CGFloat(602 - speed)
        UIView.animate(withDuration: 0.3,
                       delay: 0.1,
                       options: .curveEaseIn,
                       animations: {
                        for i in 0...12{
                            if i % 2 == 0{
                                self.bloosom[0 + i].transform = CGAffineTransform(rotationAngle: .pi / 180 * CGFloat(speed - Float(i)))
                            }
                            else{
                                self.bloosom[0 + i].transform = CGAffineTransform(rotationAngle: -(.pi / 180 * CGFloat(speed - Float(i))))
                            }
                        }
                       })
        if distanceSlider.value >= 300 && distanceSlider.value <= 360 {
            heart.alpha = 0.5
            heart.frame.origin.y = CGFloat(175 - sender.value * 0.3)
        }
        else{
            heart.alpha = 0
        }
        
    }
}


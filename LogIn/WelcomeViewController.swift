//
//  SecondViewController.swift
//  LogIn
//
//  Created by Jorgen Shiller on 30.09.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet var welcomeLabel: UILabel!
    
    var userName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome \(userName ?? "")"
        setGradientBackground()
    }
    
    private func setGradientBackground() {
        let topColor =  UIColor(
            red: 255.0/255.0,
            green: 0/255.0,
            blue: 0.0/255.0,
            alpha: 0.4
        ).cgColor
        
        let bottomColor = UIColor(
            red: 0.0/255.0,
            green: 0/255.0,
            blue: 255.0/255.0,
            alpha: 0.4
        ).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [topColor, bottomColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
        
        self.view.layer.insertSublayer(gradientLayer, at:0)
    }
}

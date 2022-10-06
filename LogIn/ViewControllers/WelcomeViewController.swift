//
//  SecondViewController.swift
//  LogIn
//
//  Created by Jorgen Shiller on 30.09.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet var welcomeLabel: UILabel!
    
    var userInfo: UserDescription!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer()
        welcomeLabel.text = "Welcome \(userInfo.person.name)"
    }
}

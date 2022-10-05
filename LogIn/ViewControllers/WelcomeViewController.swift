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
    }
}

//
//  ResumeViewController.swift
//  LogIn
//
//  Created by Jorgen Shiller on 04.10.2022.
//

import UIKit

class ResumeViewController: UIViewController {
    
    @IBOutlet var bioLabel: UILabel!
    
    var userInfo: UserDescription!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer()
        bioLabel.text = userInfo.person.bio
    }
}

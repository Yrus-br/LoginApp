//
//  ResumeViewController.swift
//  LogIn
//
//  Created by Jorgen Shiller on 04.10.2022.
//

import UIKit

class ResumeViewController: UIViewController {
    
    private let userInfo = UserName.getUserName()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer()
        navigationItem.title = "\(userInfo.name)'s bio"
    }
}

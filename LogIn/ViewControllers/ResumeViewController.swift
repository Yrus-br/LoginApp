//
//  ResumeViewController.swift
//  LogIn
//
//  Created by Jorgen Shiller on 04.10.2022.
//

import UIKit

class ResumeViewController: UIViewController {
    
    @IBOutlet var bioTextView: UITextView!
    var userInfo: UserDescription!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer()
        bioTextView.text = userInfo.person.bio
    }
}

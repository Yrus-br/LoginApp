//
//  AboutMeViewController.swift
//  LogIn
//
//  Created by Jorgen Shiller on 04.10.2022.
//

import UIKit

class AboutMeViewController: UIViewController {
    
    private let userInfo = UserName.getUserName()
    
    @IBOutlet var labelName: UILabel!
    @IBOutlet var labelSecondName: UILabel!
    @IBOutlet var labelCity: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelName.text = userInfo.name
        labelSecondName.text = userInfo.secondName
        labelCity.text = userInfo.city
    }
}


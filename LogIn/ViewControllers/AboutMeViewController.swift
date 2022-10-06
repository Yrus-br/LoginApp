//
//  AboutMeViewController.swift
//  LogIn
//
//  Created by Jorgen Shiller on 04.10.2022.
//

import UIKit

class AboutMeViewController: UIViewController {
    
    @IBOutlet var labelName: UILabel!
    @IBOutlet var labelSecondName: UILabel!
    @IBOutlet var labelCity: UILabel!
    @IBOutlet var userPhoto: UIImageView! {
        didSet {
            userPhoto.layer.cornerRadius = userPhoto.frame.height / 2
        }
    }
    
    var userInfo: UserDescription!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer()
        labelName.text = userInfo.person.name
        labelSecondName.text = userInfo.person.secondName
        labelCity.text = userInfo.person.city
        userPhoto.image = UIImage(named: userInfo.person.photo)
        navigationItem.title = "About \(userInfo.person.name)"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let resumeVc = segue.destination as? ResumeViewController else { return }
        resumeVc.userInfo = userInfo
    }
}


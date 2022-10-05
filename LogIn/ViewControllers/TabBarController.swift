//
//  TabBarController.swift
//  LogIn
//
//  Created by Jorgen Shiller on 05.10.2022.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let tabBarAppereance = UITabBarAppearance()
        tabBarAppereance.configureWithOpaqueBackground()
        tabBar.standardAppearance = tabBarAppereance
        tabBar.scrollEdgeAppearance = tabBarAppereance
    }
 

}

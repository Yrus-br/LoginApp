//
//  ViewController.swift
//  LogIn
//
//  Created by Jorgen Shiller on 30.09.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    private let userInfo = UserName.getUserName()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTF.isSecureTextEntry = true
        userNameTF.text = userInfo.name
        passwordTF.text = userInfo.password
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarVC = segue.destination as? UITabBarController else {
            return
        }
        guard let viewContollersTB = tabBarVC.viewControllers else {return}
        viewContollersTB.forEach { viewController in
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.userName = userInfo.name
                welcomeVC.view.addVerticalGradientLayer()
                
            } else if let navigationVC = viewController as? UINavigationController {
                guard let aboutMeVc = navigationVC.topViewController as? AboutMeViewController else {
                    return
                }
                aboutMeVc.view.addVerticalGradientLayer()
                aboutMeVc.navigationItem.title = "About \(userInfo.name)"
            }
        }
    }
    
    @IBAction func logInbuttonDidTapped() {
        guard userNameTF.text == userInfo.name, passwordTF.text == userInfo.password else {
            wrongPassOrLog(
                title: "Invalid login or password",
                message: "Please, enter correct login and password",
                textField: passwordTF
            )
            return
        }
        performSegue(withIdentifier: "goToWelcome", sender: nil)
    }
    
    @IBAction func unwindSegueToWelcome(segue: UIStoryboardSegue) {
        userNameTF.text = userInfo.name
        passwordTF.text = userInfo.password
    }
    
    @IBAction func forgotUserName(sender: UIButton) {
        sender.tag == 0
        ? wrongPassOrLog(title: "Wrong name?", message: "Your name is \(userInfo.name) 😉")
        : wrongPassOrLog(title: "Oops!", message: "Your password is \(userInfo.password) 😉")
    }
    
    
    private func wrongPassOrLog(
        title: String,
        message: String,
        textField: UITextField? = nil
    )
    {
        let message = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okButton = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        message.addAction(okButton)
        present(message, animated: true)
    }
    
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTF {
            passwordTF.becomeFirstResponder()
        } else {
            logInbuttonDidTapped()
        }
        return true
    }
}
extension UIView {
    func addVerticalGradientLayer() {
        let topColor = UIColor (
            red: 107/255,
            green: 148/255,
            blue: 230/255,
            alpha: 1
        )
        let bottomColor = UIColor (
            red: 210/255,
            green: 109/255,
            blue: 128/255,
            alpha: 1
        )
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [topColor.cgColor, bottomColor.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        layer.insertSublayer(gradient, at: 0)
    }
}


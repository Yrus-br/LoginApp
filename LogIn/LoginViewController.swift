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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTF.isSecureTextEntry = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let weclomeVC = segue.destination as? WelcomeViewController
        else { return }
        weclomeVC.userName = userNameTF.text
    }
    
    @IBAction func logInbuttonDidTapped() {
        guard let userName = userNameTF.text,
              let password = passwordTF.text else { return }
        if userName.isEmpty {
            wrongPassOrLog(
                title: "Please, check your user name",
                message: "Enter your name"
            )
        } else if password.isEmpty {
            wrongPassOrLog(
                title: "Forgot to enter password",
                message: "Enter your password"
            )
        } else if userName != "Alex" || password != "Efimov" {
            wrongPassOrLog(
                title: "Invalid login or password",
                message: "Please, enter correct login and password"
            )
            passwordTF.text = ""
        }
        
        performSegue(withIdentifier: "goToWelcome", sender: nil)
    }
    
    @IBAction func unwindSegueToWelcome(segue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
    }

    @IBAction func forgotUserName() {
        wrongPassOrLog(title: "User name 🤓", message: "Your name is Alex")
    }
    
    @IBAction func forgotPassword() {
        wrongPassOrLog(title: "Password 🫡", message: "Password is Efimov")
    }
}

extension LoginViewController {
    private func wrongPassOrLog (title: String, message: String) {
        let message = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let okButton = UIAlertAction(title: "OK", style: .default)
        message.addAction(okButton)
        present(message, animated: true)
    }
}

extension LoginViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTF {
            passwordTF.becomeFirstResponder()
        } else {
            logInbuttonDidTapped()
        }
        return true
    }
}

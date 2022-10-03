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
    
    private let user = "Yurii"
    private let password = "Mal"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTF.isSecureTextEntry = true
        userNameTF.text = user
        passwordTF.text = password
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let weclomeVC = segue.destination as? WelcomeViewController else { return }
        weclomeVC.userName = user
    }
    
    @IBAction func logInbuttonDidTapped() {
        guard userNameTF.text == user, passwordTF.text == password else {
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
        userNameTF.text = user
        passwordTF.text = password
    }
    
    @IBAction func forgotUserName(sender: UIButton) {
        sender.tag == 0
        ? wrongPassOrLog(title: "Wrong name?", message: "Your name is \(user) 😉")
        : wrongPassOrLog(title: "Oops!", message: "Your password is \(password) 😉")
    }
    
    
    private func wrongPassOrLog (title: String, message: String, textField: UITextField? = nil ) {
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
    
    private func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTF {
            passwordTF.becomeFirstResponder()
        } else {
            logInbuttonDidTapped()
        }
        return true
    }
}


//
//  ViewController.swift
//  LoginWithViewCode
//
//  Created by DAVI PEREIRA DA SILVA on 27/12/23.
//

import UIKit

class LoginViewController: UIViewController {
    var loginScreen: LoginScreen?

    let simulatedEmail = "my@email.com"
    let simulatedPassword = "123456"

    override func loadView() {
        self.loginScreen = LoginScreen()

        self.view = self.loginScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginScreen?.setDelegate(delegate: self)
        self.loginScreen?.setupTextFieldsDelegate(delegate: self)

        self.navigationController?.navigationBar.tintColor = .white
    }

    private func isValidCredentials() -> Bool {
        let email = loginScreen?.emailTextField.text ?? ""
        let password = loginScreen?.passwordTextField.text ?? ""

        return email == self.simulatedEmail && password == self.simulatedPassword
    }

    private func showAlert() {
        let alertController = UIAlertController(title: "Sign In failure", message: "Invalid email/password. Try again", preferredStyle: .alert)

        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)

        present(alertController, animated: true, completion: nil)
    }
}

extension LoginViewController: LoginScreenProtocol {
    func actionSignInButton() {
        if isValidCredentials() {
            let welcomeViewController = WelcomViewController()

            self.navigationController?.pushViewController(welcomeViewController, animated: true)
        } else {
            showAlert()
        }
    }
    
    func actionRegisterButton() {
        let registerViewController = RegisterViewController()

        self.navigationController?.pushViewController(registerViewController, animated: true)
        self.navigationItem.title = "Back"
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(#function)
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        self.loginScreen?.validateTextFields()
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()

        return true
    }
}

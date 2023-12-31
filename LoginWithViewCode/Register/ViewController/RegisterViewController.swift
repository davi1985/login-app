//
//  RegisterViewController.swift
//  LoginWithViewCode
//
//  Created by DAVI PEREIRA DA SILVA on 28/12/23.
//

import UIKit

class RegisterViewController: UIViewController {
    var registerScreen: RegisterScreen?

    override func loadView() {
        self.registerScreen = RegisterScreen()

        self.view = self.registerScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.registerScreen?.setupTextFieldDelegate(delegate: self)
        self.registerScreen?.delegate(delegate: self)
    }
}

extension RegisterViewController: UITextFieldDelegate {

    func textFieldDidEndEditing(_ textField: UITextField) {
        self.registerScreen?.validateTextFields()
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()

        return true
    }

}

extension RegisterViewController: RegisterScreenProtocol {

    func actionRegisterButton() {
        let welcomeViewController = WelcomViewController()

        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
}

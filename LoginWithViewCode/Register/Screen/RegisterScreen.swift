//
//  RegisterScreen.swift
//  LoginWithViewCode
//
//  Created by DAVI PEREIRA DA SILVA on 28/12/23.
//

import UIKit

protocol RegisterScreenProtocol:AnyObject {
    func actionRegisterButton()
}

class RegisterScreen: UIView {

    weak private var delegate: RegisterScreenProtocol?

    func delegate(delegate:RegisterScreenProtocol?) {
        self.delegate = delegate
    }

    lazy var userIconImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "person.badge.plus")
        image.tintColor = UIColor(red: 226/255, green: 226/255, blue: 230/255, alpha: 1)
        image.contentMode = .scaleAspectFit
        
        return image
    }()

    lazy var fullNameTextField: UITextField = {
        let textField = UITextField()
        let placeholderColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0)
        let attributes: [NSAttributedString.Key: Any] = [ .foregroundColor: placeholderColor]
        textField.attributedPlaceholder = NSAttributedString(string: "Your name", attributes: attributes)

        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.backgroundColor = UIColor(red: 50/255, green: 50/255, blue: 56/255, alpha: 1)
        textField.borderStyle = .roundedRect
        textField.keyboardType = .emailAddress
        textField.textColor = UIColor(red: 226/255, green: 226/255, blue: 230/255, alpha: 1)
        textField.clipsToBounds = true

        return textField
    }()

    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        let placeholderColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0)
        let attributes: [NSAttributedString.Key: Any] = [ .foregroundColor: placeholderColor]
        textField.attributedPlaceholder = NSAttributedString(string: "Your e-mail", attributes: attributes)

        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.backgroundColor = UIColor(red: 50/255, green: 50/255, blue: 56/255, alpha: 1)
        textField.borderStyle = .roundedRect
        textField.keyboardType = .emailAddress
        textField.textColor = UIColor(red: 226/255, green: 226/255, blue: 230/255, alpha: 1)
        textField.clipsToBounds = true

        return textField
    }()

    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        let placeholderColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0)
        let attributes: [NSAttributedString.Key: Any] = [ .foregroundColor: placeholderColor]
        textField.attributedPlaceholder = NSAttributedString(string: "Your password", attributes: attributes)

        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.backgroundColor = UIColor(red: 50/255, green: 50/255, blue: 56/255, alpha: 1)
        textField.borderStyle = .roundedRect
        textField.keyboardType = .default
        textField.textColor = UIColor(red: 226/255, green: 226/255, blue: 230/255, alpha: 1)
        textField.isSecureTextEntry = true
        textField.clipsToBounds = true

        return textField
    }()

    lazy var confirmPasswordTextField: UITextField = {
        let textField = UITextField()
        let placeholderColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0)
        let attributes: [NSAttributedString.Key: Any] = [ .foregroundColor: placeholderColor]
        textField.attributedPlaceholder = NSAttributedString(string: "Confirm your password", attributes: attributes)

        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.backgroundColor = UIColor(red: 50/255, green: 50/255, blue: 56/255, alpha: 1)
        textField.borderStyle = .roundedRect
        textField.keyboardType = .emailAddress
        textField.textColor = UIColor(red: 226/255, green: 226/255, blue: 230/255, alpha: 1)
        textField.isSecureTextEntry = true
        textField.clipsToBounds = true

        return textField
    }()

    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red: 0/255, green: 135/255, blue: 95/255, alpha: 1)
        button.setTitle("Register", for: .normal)
        button.setTitleColor(UIColor(red: 226/255, green: 226/255, blue: 230/255, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
       button.addTarget(self, action: #selector(self.registerButtonTapped), for: .touchUpInside)

        return button

    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.setupBackground()
        self.addSubviews()
        self.setupContraints()
        self.updateRegisterButtonState(isEnabled: false)
    }

    private func addSubviews() {
        self.addSubview(self.userIconImageView)
        self.addSubview(self.fullNameTextField)
        self.addSubview(self.emailTextField)
        self.addSubview(self.passwordTextField)
        self.addSubview(self.confirmPasswordTextField)
        self.addSubview(self.registerButton)
    }

    private func setupBackground() {
        self.backgroundColor = UIColor(red: 18/255, green: 18/255, blue: 20/255, alpha: 1.0)
    }

    public func setupTextFieldDelegate(delegate: UITextFieldDelegate) {
        self.fullNameTextField.delegate = delegate
        self.emailTextField.delegate = delegate
        self.passwordTextField.delegate = delegate
        self.confirmPasswordTextField.delegate = delegate
    }

    @objc private func registerButtonTapped() {
        self.delegate?.actionRegisterButton()
    }

    public func validateTextFields() {
        let fullName = self.fullNameTextField.text ?? ""
        let email = self.emailTextField.text ?? ""
        let password = self.passwordTextField.text ?? ""
        let confirmPassword = self.confirmPasswordTextField.text ?? ""

        let isButtonEnabled = !fullName.isEmpty && !email.isEmpty && !password.isEmpty && !confirmPassword.isEmpty

        self.updateRegisterButtonState(isEnabled: isButtonEnabled)
    }

    private func updateRegisterButtonState(isEnabled: Bool) {
        let titleColor = isEnabled ? UIColor(red: 226/255, green: 226/255, blue: 230/255, alpha: 1) : .lightGray

        self.registerButton.isEnabled = isEnabled
        self.registerButton.setTitleColor(titleColor, for: .normal)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupContraints() {
        NSLayoutConstraint.activate([

            self.userIconImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 100),
            self.userIconImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.userIconImageView.heightAnchor.constraint(equalToConstant: 100),
            self.userIconImageView.widthAnchor.constraint(equalToConstant: 100),

            self.fullNameTextField.topAnchor.constraint(equalTo: self.userIconImageView.bottomAnchor, constant: 20),
            self.fullNameTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.fullNameTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.fullNameTextField.heightAnchor.constraint(equalToConstant: 45),

            self.emailTextField.topAnchor.constraint(equalTo: self.fullNameTextField.bottomAnchor, constant: 20),
            self.emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.emailTextField.heightAnchor.constraint(equalToConstant: 45),

            self.passwordTextField.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 20),
            self.passwordTextField.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            self.passwordTextField.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            self.passwordTextField.heightAnchor.constraint(equalTo: self.emailTextField.heightAnchor),

            self.confirmPasswordTextField.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 20),
            self.confirmPasswordTextField.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            self.confirmPasswordTextField.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            self.confirmPasswordTextField.heightAnchor.constraint(equalTo: self.emailTextField.heightAnchor),

            self.registerButton.topAnchor.constraint(equalTo: self.confirmPasswordTextField.bottomAnchor, constant: 20),
            self.registerButton.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            self.registerButton.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            self.registerButton.heightAnchor.constraint(equalTo: self.emailTextField.heightAnchor),
        ])
    }
}

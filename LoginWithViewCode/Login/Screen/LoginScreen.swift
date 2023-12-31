//
//  LoginScreen.swift
//  LoginWithViewCode
//
//  Created by DAVI PEREIRA DA SILVA on 27/12/23.
//

import UIKit

protocol LoginScreenProtocol:AnyObject{
    func actionSignInButton()
    func actionRegisterButton()
}

class LoginScreen: UIView {
    private weak var delegate: LoginScreenProtocol?

    func setDelegate(delegate: LoginScreenProtocol) {
        self.delegate = delegate
    }

    lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 226/255, green: 226/255, blue: 230/255, alpha: 1)
        label.font =  UIFont.systemFont(ofSize: 30)
        label.text = "My App"

        return label
    }()

    lazy var logoAppImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "person.crop.circle.fill")
        image.tintColor = UIColor(red: 226/255, green: 226/255, blue: 230/255, alpha: 1)
        image.contentMode = .scaleAspectFit

        return image
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
        textField.keyboardType = .emailAddress
        textField.textColor = UIColor(red: 226/255, green: 226/255, blue: 230/255, alpha: 1)
        textField.isSecureTextEntry = true
        textField.clipsToBounds = true

        return textField
    }()

    lazy var signInButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red: 0/255, green: 135/255, blue: 95/255, alpha: 1)
        button.setTitle("Sign In", for: .normal)
        button.setTitleColor(UIColor(red: 226/255, green: 226/255, blue: 230/255, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.addTarget(self, action: #selector(self.signInButtonTapped), for: .touchUpInside)

        return button
    }()

    lazy var registerButton: UIButton = {
        let button = UIButton()
        let buttonTitle = "Don't have an account? Register now."
        let attributedString = NSMutableAttributedString(string: buttonTitle)
        let range = (buttonTitle as NSString).range(of: "Register now")

        attributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: range)

        button.setAttributedTitle(attributedString, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setAttributedTitle(attributedString, for: .normal)
        button.setTitleColor(UIColor(red: 226/255, green: 226/255, blue: 230/255, alpha: 1), for: .normal)
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

    private func setupBackground() {
        self.backgroundColor = UIColor(red: 18/255, green: 18/255, blue: 20/255, alpha: 1.0)
    }

    private func addSubviews() {
        self.addSubview(self.loginLabel)
        self.addSubview(self.logoAppImageView)
        self.addSubview(self.emailTextField)
        self.addSubview(self.passwordTextField)
        self.addSubview(self.signInButton)
        self.addSubview(self.registerButton)
    }

    public func setupTextFieldsDelegate(delegate: UITextFieldDelegate) {
        self.emailTextField.delegate = delegate
        self.passwordTextField.delegate = delegate
    }

    @objc private func signInButtonTapped() {
        self.delegate?.actionSignInButton()
    }

    @objc private func registerButtonTapped() {
        self.delegate?.actionRegisterButton()
    }


    public func validateTextFields() {
        let email = self.emailTextField.text ?? ""
        let password = self.passwordTextField.text ?? ""

        let isButtonEnabled = !email.isEmpty && !password.isEmpty

        self.updateRegisterButtonState(isEnabled: isButtonEnabled)
    }

    private func updateRegisterButtonState(isEnabled: Bool) {
        let titleColor = isEnabled ? UIColor(red: 226/255, green: 226/255, blue: 230/255, alpha: 1) : .lightGray

        self.signInButton.isEnabled = isEnabled
        self.signInButton.setTitleColor(titleColor, for: .normal)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupContraints() {
        NSLayoutConstraint.activate([
            self.loginLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 100),
            self.loginLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),

            self.logoAppImageView.topAnchor.constraint(equalTo: self.loginLabel.bottomAnchor, constant: 20),
            self.logoAppImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
            self.logoAppImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60),
            self.logoAppImageView.heightAnchor.constraint(equalToConstant: 100),

            self.emailTextField.topAnchor.constraint(equalTo: self.logoAppImageView.bottomAnchor, constant: 20),
            self.emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.emailTextField.heightAnchor.constraint(equalToConstant: 45),

            self.passwordTextField.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 20),
            self.passwordTextField.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            self.passwordTextField.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            self.passwordTextField.heightAnchor.constraint(equalTo: self.emailTextField.heightAnchor),

            self.signInButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 20),
            self.signInButton.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            self.signInButton.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            self.signInButton.heightAnchor.constraint(equalTo: self.emailTextField.heightAnchor),

            self.registerButton.topAnchor.constraint(equalTo: self.signInButton.bottomAnchor, constant: 20),
            self.registerButton.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            self.registerButton.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            self.registerButton.heightAnchor.constraint(equalTo: self.emailTextField.heightAnchor),
        ])
    }
}

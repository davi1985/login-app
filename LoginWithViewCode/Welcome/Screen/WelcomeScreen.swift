//
//  WelcomeScreen.swift
//  LoginWithViewCode
//
//  Created by DAVI PEREIRA DA SILVA on 30/12/23.
//

import UIKit

class WelcomeScreen: UIView {

    lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Welcome here"
        label.textColor = UIColor(red: 226/255, green: 226/255, blue: 230/255, alpha: 1)
        label.font =  UIFont.systemFont(ofSize: 30)

        return label
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)

        self.setupBackground()
        self.addSubviews()
        self.setupContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupBackground() {
        self.backgroundColor = UIColor(red: 18/255, green: 18/255, blue: 20/255, alpha: 1.0)
    }

    private func addSubviews() {
        self.addSubview(welcomeLabel)
    }

    private func setupContraints() {
        NSLayoutConstraint.activate([
            self.welcomeLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.welcomeLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }

}

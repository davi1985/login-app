//
//  WelcomViewController.swift
//  LoginWithViewCode
//
//  Created by DAVI PEREIRA DA SILVA on 30/12/23.
//

import UIKit

class WelcomViewController: UIViewController {

    var welcomeScreen: WelcomeScreen?

    override func loadView() {
        self.welcomeScreen = WelcomeScreen()
   
        self.view = self.welcomeScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

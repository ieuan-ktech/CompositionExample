//
//  LoginUI.swift
//  MVPComputerConfigurator
//
//  Created by Hayden Young on 17/05/2017.
//  Copyright © 2017 Chirone. All rights reserved.
//

import UIKit

class LoginUI: LoginUIProtocol {
	
	var usernameTextFieldDidChange: (() -> ())?
	var usernameTextField: UITextField = {
		let textField = UITextField()
		textField.font = UIFont.systemFont(ofSize: 14)
		textField.placeholder = "Username"
		textField.text = "apptest2@kobaltmusic.com"
		return textField
		}() {
		didSet {
			usernameTextFieldDidChange?()
		}
	}
	
	
	var passwordTextFieldDidChange: (() -> ())?
	var passwordTextField: UITextField = {
		let textField = UITextField()
		textField.font = UIFont.systemFont(ofSize: 14)
		textField.placeholder = "Password"
		textField.text = "Rec0rd1ng"
		return textField
		}() {
		didSet {
			passwordTextFieldDidChange?()
		}
	}
	
	var loginButtonDidChange: (() -> ())?
	var loginButton: UIButton = {
		let button = UIButton(stateConfigurations: [UIButtonStateConfiguration(title: "Login")], actionConfigurations: nil, font: UIFont.systemFont(ofSize: 14), textColor: .black, multilined: false)
		return button
		}() {
		didSet {
			loginButtonDidChange?()
		}
	}
	
	var forgotButtonDidChange: (() -> ())?
	var forgotPasswordButton: UIButton = {
		let button = UIButton(stateConfigurations: [UIButtonStateConfiguration(title: "Forgot Password")], actionConfigurations: nil, font: UIFont.systemFont(ofSize: 14), textColor: .black, multilined: false)
		return button
		}() {
		didSet {
			forgotButtonDidChange?()
		}
	}
	
	
	func setupUIOn(view: UIView) {
		
		view.backgroundColor = .brown
		
		triggerUIDidChange()
		
		addViewsOn(view: view)
		
		setupLayoutOn(view: view)		
	}
	
	private func triggerUIDidChange() {
		usernameTextFieldDidChange?()
		passwordTextFieldDidChange?()
		loginButtonDidChange?()
		forgotButtonDidChange?()
	}
	
	private func addViewsOn(view: UIView) {
		view.addSubview(usernameTextField)
		view.addSubview(passwordTextField)
		view.addSubview(loginButton)
		view.addSubview(forgotPasswordButton)
	}
	
	private func setupLayoutOn(view: UIView) {
		usernameTextField.translatesAutoresizingMaskIntoConstraints = false
		passwordTextField.translatesAutoresizingMaskIntoConstraints = false
		loginButton.translatesAutoresizingMaskIntoConstraints = false
		forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false
		
		let views: [String: UIView] = ["usernameTextField": usernameTextField,
		                               "passwordTextField": passwordTextField,
		                               "loginButton": loginButton,
		                               "forgotPasswordButton": forgotPasswordButton]
		var constraints: [NSLayoutConstraint]?
		
		//--- vertical layout
		constraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-(20)-[usernameTextField]-[passwordTextField]-[loginButton]-[forgotPasswordButton]", options: [.alignAllLeading, .alignAllTrailing], metrics: nil, views: views)
		view.addConstraints(constraints!)
		
		//--- horizontal layout
		constraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-(20)-[usernameTextField]-(20)-|", options: .init(rawValue: 0), metrics: nil, views: views)
		view.addConstraints(constraints!)
	}
	
}

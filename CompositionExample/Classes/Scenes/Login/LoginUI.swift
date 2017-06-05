//
//  LoginUI.swift
//  MVPComputerConfigurator
//
//  Created by Hayden Young on 17/05/2017.
//  Copyright © 2017 Chirone. All rights reserved.
//

import UIKit

private struct LoginUIConstants {
	static let forgotPasswordBottomConstraintConstant: CGFloat = 20.0
}

class LoginUI: LoginUIProtocol {
	// --------------------------------------------------------------------------------------
	// MARK: - Properties
	// --------------------------------------------------------------------------------------
	var usernameTextFieldDidChange: (() -> ())?
	var usernameTextField: UITextField = {
		let textField = UITextField()
		textField.font = UIFont.systemFont(ofSize: 14)
		textField.placeholder = "Username"
		textField.text = "user"
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
		textField.text = "password"
		textField.isSecureTextEntry = true
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
	
	private weak var view: UIView?
	private var forgotPasswordBottomConstraint: NSLayoutConstraint?
	
	// --------------------------------------------------------------------------------------
	// MARK: - Setup
	// --------------------------------------------------------------------------------------
	
	deinit {
		NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillShow, object: nil)
		NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillHide, object: nil)
	}
	
	func setupUIOn(view: UIView) {
		self.view = view
		
		view.backgroundColor = .brown
		
		triggerUIDidChange()
		
		addViewsOn(view: view)
		
		setupLayoutOn(view: view)
		
		NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardWillChange(notification:)), name: .UIKeyboardWillShow, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardWillChange(notification:)), name: .UIKeyboardWillHide, object: nil)
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
	
	// --------------------------------------------------------------------------------------
	// MARK: - Layout
	// --------------------------------------------------------------------------------------
	
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
		
		//--- forgot password bottom = view bottom
		forgotPasswordBottomConstraint = view.bottomAnchor.activateConstraint(equalTo: forgotPasswordButton.bottomAnchor, constant: LoginUIConstants.forgotPasswordBottomConstraintConstant)
		
		//--- vertical layout
		constraints = NSLayoutConstraint.constraints(withVisualFormat: "V:[usernameTextField]-[passwordTextField]-[loginButton]-[forgotPasswordButton]", options: [.alignAllLeading, .alignAllTrailing], metrics: nil, views: views)
		view.addConstraints(constraints!)
		
		//--- horizontal layout
		constraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-(20)-[usernameTextField]-(20)-|", options: .init(rawValue: 0), metrics: nil, views: views)
		view.addConstraints(constraints!)
	}
	
	// --------------------------------------------------------------------------------------
	// MARK: - Keyboard Notification
	// --------------------------------------------------------------------------------------
	
	@objc private func handleKeyboardWillChange(notification: Notification) {
		guard let userInfo = notification.userInfo,
			let forgotPasswordBottomConstraint = forgotPasswordBottomConstraint else {
				return
		}
		
		guard let endFrame = userInfo[UIKeyboardFrameEndUserInfoKey] as? CGRect,
			let duration = userInfo[UIKeyboardAnimationDurationUserInfoKey] as? TimeInterval,
		 	let view = view else {
				return
		}
		
		forgotPasswordBottomConstraint.constant = view.frame.height - endFrame.origin.y + LoginUIConstants.forgotPasswordBottomConstraintConstant
		
		UIView.animate(withDuration: duration) { [unowned self] in
			self.view?.layoutIfNeeded()
		}
	}
	
}

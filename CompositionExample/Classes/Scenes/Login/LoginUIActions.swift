//
//  LoginUIActions.swift
//  MVPComputerConfigurator
//
//  Created by Hayden Young on 31/05/2017.
//  Copyright © 2017 Chirone. All rights reserved.
//

import UIKit

class LoginUIActions: LoginUIActionsProtocol {

	// --------------------------------------------------------------------------------------
	// MARK: - Protocol Properties
	// --------------------------------------------------------------------------------------
	
	weak var router: LoginRouter?
	weak var loginUI: LoginUIProtocol? {
		didSet {
			loginUI?.loginButtonDidChange = { [unowned self] in
				self.loginUI?.loginButton.addTarget(self, action: #selector(self.loginAction(sender:)), for: .touchUpInside)
			}
			loginUI?.forgotButtonDidChange = { [unowned self] in
				self.loginUI?.forgotPasswordButton.addTarget(self, action: #selector(self.forgotPasswordAction(sender:)), for: .touchUpInside)
			}
		}
	}
	weak var errorPresentor: ErrorPresentable?
	weak var loginViewModel: LoginViewModelProtocol?

	
	// --------------------------------------------------------------------------------------
	// MARK: - Button Actions
	// --------------------------------------------------------------------------------------
	
	@objc func loginAction(sender: UIButton) {
		
		//--- check for existance of text in the text fields
		guard
			let username = loginUI?.usernameTextField.text,
			let password = loginUI?.passwordTextField.text else {
				return
		}
		
		//--- ask the view model to carry out the login
		loginViewModel?.loginWith(username: username, password: password, completion: { [unowned self] error in
			guard error == nil else {
				self.errorPresentor?.show(error: error!)
				return
			}
			
			self.router?.finishLoginRoute(animated: true, completion: nil)
			
		})
	}
	
	@objc func forgotPasswordAction(sender: UIButton) {
		router?.presentForgotPassword(animated: true, completion: nil)
	}
	
}

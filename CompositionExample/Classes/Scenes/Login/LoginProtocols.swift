//
//  LoginProtocols.swift
//  MVPComputerConfigurator
//
//  Created by Hayden Young on 31/05/2017.
//  Copyright © 2017 Chirone. All rights reserved.
//

import UIKit

// --------------------------------------------------------------------------------------
// MARK: - Router Protocol
// --------------------------------------------------------------------------------------

protocol LoginRouterProtocol: class {
	
	func finishLoginRoute(animated: Bool, completion:(() -> Swift.Void)?)
	
	func presentForgotPassword(animated: Bool, completion:(() -> Swift.Void)?)
}

// --------------------------------------------------------------------------------------
// MARK: - UI Protocol
// --------------------------------------------------------------------------------------

protocol LoginUIProtocol: class {
	var usernameTextFieldDidChange: (() -> ())? { get set }
	var usernameTextField: UITextField { get }
	
	var passwordTextFieldDidChange: (() -> ())? { get set }
	var passwordTextField: UITextField { get }
	
	var loginButtonDidChange: (() -> ())? { get set }
	var loginButton: UIButton { get }
	
	var forgotButtonDidChange: (() -> ())? { get set }
	var forgotPasswordButton: UIButton { get }
	
	func setupUIOn(view: UIView)
}

// --------------------------------------------------------------------------------------
// MARK: - UI Actions Protocol
// --------------------------------------------------------------------------------------

protocol LoginUIActionsProtocol: class {

	weak var errorPresentor: ErrorPresentable? { get set }
	weak var loginUI: LoginUIProtocol? { get set }
	weak var loginViewModel: LoginViewModelProtocol? { get set }
	weak var router: LoginRouter? { get set }
	
	func loginAction(sender: UIButton);
	func forgotPasswordAction(sender: UIButton);
	
}

// --------------------------------------------------------------------------------------
// MARK: - View Model Protocol
// --------------------------------------------------------------------------------------

protocol LoginViewModelProtocol: class {
	
	func loginWith(username: String, password: String, completion: @escaping (_: Error? ) -> Void)
	
}

// --------------------------------------------------------------------------------------
// MARK: - API Protocol
// --------------------------------------------------------------------------------------
protocol LoginAPIProtocol {
	var accessToken: String? { get set }
	
	func getAuthTokenWith(username: String, password: String, completion: @escaping (_ request: URLRequest?, _ result: Any?, _ error: Error?) -> Void)
}

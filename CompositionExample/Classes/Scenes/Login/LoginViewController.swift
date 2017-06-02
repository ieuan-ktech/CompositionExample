//
//  LoginViewController.swift
//  MVPComputerConfigurator
//
//  Created by Hayden Young on 15/05/2017.
//  Copyright © 2017 Chirone. All rights reserved.
//

import UIKit

// --------------------------------------------------------------------------------------
// MARK: - Login View Controller
// --------------------------------------------------------------------------------------

class LoginViewController: UIViewController, ErrorPresentable {
	
	var router: LoginRouterProtocol?
	var loginUI: LoginUIProtocol?
	var loginUIActions: LoginUIActionsProtocol?
	var viewModel: LoginViewModelProtocol?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		loginUI?.setupUIOn(view: view)
	}
	
}

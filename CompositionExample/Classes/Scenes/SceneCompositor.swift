//
//  SceneFactory.swift
//  MVPComputerConfigurator
//
//  Created by Hayden Young on 15/05/2017.
//  Copyright © 2017 Chirone. All rights reserved.
//
//
//
//	Usage Instructions
//		1. Create new method to return an instance of the View Controller that represents the scene
//		2. Create the components that will be added to the View Controller
//		3. Composite the components together
//		4. Profit
//
//	Notes:
//		• Components must be completely independent from each other and communicate only via protocols
//		• Only View Controller can have a strong reference to components unless it doesn't have a reference to a given component. e.g, a View Model component will have a strong reference to an API Manager component as it is not required by the View Controller
//
//

import UIKit


struct SceneCompositor {
	
	static func configure(rootViewController: RootViewController) {
		let router = RootRouter()
		router.viewController = rootViewController
		rootViewController.router = router
	}
	
	static func splashViewController() -> SplashViewController {
		//--- COMPONENTS
		let splashUI = SplashUI()
		
		//--- COMPOSITION
		let splashVC = SplashViewController()
		splashVC.splashUI = splashUI
		
		return splashVC
	}
	
	static func loginViewController() -> LoginViewController {
		//--- COMPONENTS
		let loginUI = LoginUI()
		let loginUIActions = LoginUIActions()
		let loginViewModel = LoginViewModel()
		let loginRouter = LoginRouter()
		let apiManager = MockAPIManager.sharedInstance
		let loginVC = LoginViewController()
		
		//--- COMPOSITION
		//--- ui actions
		loginUIActions.loginUI = loginUI
		loginUIActions.errorPresentor = loginVC
		loginUIActions.router = loginRouter
		loginUIActions.loginViewModel = loginViewModel
		
		//--- view-model
		loginViewModel.loginAPI = apiManager
		
		//--- view controller
		loginVC.loginUI = loginUI
		loginVC.loginUIActions = loginUIActions
		loginVC.viewModel = loginViewModel
		loginVC.router = loginRouter
		
		
		return loginVC
	}
}

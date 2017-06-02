//
//  RootRouter.swift
//  MVPComputerConfigurator
//
//  Created by Hayden Young on 17/05/2017.
//  Copyright © 2017 Nimbletank. All rights reserved.
//

import UIKit


class RootRouter: RootRouterProtocol {
	
	weak var viewController: UIViewController?
	
	var splashVC: SplashViewController!
	var loginVC: LoginViewController!
	
	func presentSplashScene(animated: Bool, completion: (() -> Void)? = nil) {
		//--- get splash from factory and add it
		splashVC = SceneCompositor.splashViewController()
		let view = viewController?.view;
		view?.addSubview(splashVC.view)
		splashVC.view.frame = (view?.bounds)!
	}
	
	func transitionFromSplashToLogin(animated: Bool, completion: (() -> Void)?) {
		//--- get and add login
		loginVC = SceneCompositor.loginViewController()
		let view = viewController?.view
		loginVC.view.frame = (view?.bounds)!
		view?.insertSubview(loginVC.view, belowSubview: splashVC.view)
		viewController?.addChildViewController(loginVC)
		
		//--- animate splash off
		let duration = animated ? 0.25 : 0.0
		UIView.animate(withDuration: duration, animations: { [unowned self] in
			self.splashVC.view.alpha = 0.0
		}) { [unowned self] (finished: Bool) in
			self.splashVC.view.removeFromSuperview()
			self.splashVC = nil
		}
	}
	
	func transitionFromLoginToHome(animated: Bool, completion: (() -> Void)?) {
		
	}
}



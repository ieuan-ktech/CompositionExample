//
//  LoginRouter.swift
//  MVPComputerConfigurator
//
//  Created by Hayden Young on 17/05/2017.
//  Copyright © 2017 Chirone. All rights reserved.
//

import UIKit

class LoginRouter: LoginRouterProtocol {

	var loginDidSucceed: (() -> ())?
	
	func finishLoginRoute(animated: Bool, completion:(() -> ())?) {
		loginDidSucceed?()
	}
	
	func presentForgotPassword(animated: Bool, completion:(() -> ())?) {
		
	}
	
}

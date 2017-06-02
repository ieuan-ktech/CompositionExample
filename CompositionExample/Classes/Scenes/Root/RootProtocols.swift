//
//  RootProtocols.swift
//  MVPComputerConfigurator
//
//  Created by Hayden Young on 01/06/2017.
//  Copyright © 2017 Chirone. All rights reserved.
//

import UIKit

// --------------------------------------------------------------------------------------
// MARK: - Router Protocol
// --------------------------------------------------------------------------------------

protocol RootRouterProtocol {
	func presentSplashScene(animated: Bool, completion:(() -> Swift.Void)?)
	
	func transitionFromSplashToLogin(animated: Bool, completion:(() -> Swift.Void)?)
	
	func transitionFromLoginToHome(animated: Bool, completion:(() -> Swift.Void)?)
}


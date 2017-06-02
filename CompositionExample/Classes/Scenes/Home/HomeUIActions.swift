//
//  HomeActions.swift
//  MVPComputerConfigurator
//
//  Created by Hayden Young on 31/05/2017.
//  Copyright © 2017 Chirone. All rights reserved.
//

import UIKit

class HomeUIActions: NSObject, HomeUIActionsProtocol {
	
	weak var homeUI: HomeUIProtocol?
	
	@IBAction func feelsGreatAction(_ sender: Any) {
		homeUI?.messageLabel?.text = "Glad to hear!"
		DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [unowned self] in
			
			self.homeUI?.messageLabel?.text = "You are home. How do you feel?"
		
		}
	}
	
	@IBAction func scaredAction(_ sender: Any) {
		homeUI?.messageLabel?.text = "Ha Ha! Shame!"
		DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [unowned self] in
			
			self.homeUI?.messageLabel?.text = "You are home. How do you feel?"
			
		}
	}
}

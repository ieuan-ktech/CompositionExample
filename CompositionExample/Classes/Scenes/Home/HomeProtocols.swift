//
//  HomeProtocols.swift
//  MVPComputerConfigurator
//
//  Created by Hayden Young on 31/05/2017.
//  Copyright © 2017 Chirone. All rights reserved.
//

import UIKit

@objc protocol HomeUIProtocol: class {
	var messageLabel: UILabel? { get set }
	var feelsGreatButton: UIButton? { get set }
	var scaredButton: UIButton? { get set }
}

@objc protocol HomeUIActionsProtocol: class {
	
	weak var homeUI: HomeUIProtocol? { get set }
	
	func feelsGreatAction(_ sender: Any)
	func scaredAction(_ sender: Any)
	
}

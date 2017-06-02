//
//  SplashUI.swift
//  MVPComputerConfigurator
//
//  Created by Hayden Young on 17/05/2017.
//  Copyright © 2017 Chirone. All rights reserved.
//

import UIKit

class SplashUI: SplashUIProtocol {

	var label: UILabel = UILabel(text: "SPLASH!", font: UIFont.systemFont(ofSize: 24))
	
	func setupUIOn(view: UIView) {
		view.addSubview(label)
		
		label.translatesAutoresizingMaskIntoConstraints = false
		
		label.centerXAnchor.activateConstraint(equalTo: view.centerXAnchor)
		label.centerYAnchor.activateConstraint(equalTo: view.centerYAnchor)
	}
}

//
//  HomeUI.swift
//  MVPComputerConfigurator
//
//  Created by Hayden Young on 31/05/2017.
//  Copyright © 2017 Chirone. All rights reserved.
//

import UIKit

class HomeUI: NSObject, HomeUIProtocol {

	@IBOutlet weak var messageLabel: UILabel?
	
	@IBOutlet weak var feelsGreatButton: UIButton? {
		didSet {
			feelsGreatButton?.backgroundColor = .darkGray
			feelsGreatButton?.setTitleColor(.white, for: .normal)
			feelsGreatButton?.layer.cornerRadius = 5
		}
	}
	@IBOutlet weak var scaredButton: UIButton? {
		didSet {
			scaredButton?.backgroundColor = .red
			scaredButton?.setTitleColor(.black, for: .normal)
			scaredButton?.layer.cornerRadius = 5
		}
	}
	

}




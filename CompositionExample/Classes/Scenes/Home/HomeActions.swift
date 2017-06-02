//
//  HomeActions.swift
//  MVPComputerConfigurator
//
//  Created by Hayden Young on 31/05/2017.
//  Copyright © 2017 Nimbletank. All rights reserved.
//

import UIKit

class HomeActions: NSObject {
	
	weak var homeUI: HomeUIProtocol?
	
	@IBAction func buttonAction(_ sender: Any) {
		homeUI?.button.setTitle("DUCK", for: .normal)
	}

}

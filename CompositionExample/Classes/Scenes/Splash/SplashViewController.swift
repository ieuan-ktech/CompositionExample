//
//  SplashViewController.swift
//  MVPComputerConfigurator
//
//  Created by Hayden Young on 15/05/2017.
//  Copyright © 2017 Chirone. All rights reserved.
//

import UIKit


class SplashViewController: UIViewController {
	
	var splashUI: SplashUIProtocol?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Do any additional setup after loading the view.
		
		view.backgroundColor = .yellow
		
		splashUI?.setupUIOn(view: view)
	}
	
}

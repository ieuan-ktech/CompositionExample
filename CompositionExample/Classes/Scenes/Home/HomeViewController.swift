//
//  HomeViewController.swift
//  MVPComputerConfigurator
//
//  Created by Hayden Young on 01/06/2017.
//  Copyright © 2017 Chirone. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
	
	@IBOutlet var homeUI: HomeUIProtocol?
	@IBOutlet var homeUIActions: HomeUIActionsProtocol?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
}

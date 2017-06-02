//
//  ViewController.swift
//  MVPComputerConfigurator
//
//  Created by Hayden Young on 15/05/2017.
//  Copyright © 2017 Chirone. All rights reserved.
//

import UIKit


class RootViewController: UIViewController {

	var router: RootRouterProtocol?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		SceneCompositor.configure(rootViewController: self)
		
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		
		router?.presentSplashScene(animated: false, completion: nil)
		
		DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: { [unowned self] in
			self.router?.transitionFromSplashToLogin(animated: true, completion: nil)
		})
	}

}



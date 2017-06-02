//
//  UIViewControllerErrorProtocol.swift
//  MVPComputerConfigurator
//
//  Created by Hayden Young on 18/05/2017.
//  Copyright © 2017 Nimbletank. All rights reserved.
//

import UIKit

protocol ErrorPresentable: class {
	func show(error: Error)
}

extension ErrorPresentable where Self: UIViewController {
	func show(error: Error) {
		guard let myError = error as? MyError else {
			
			let alertController = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
			alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
			
			self.present(alertController, animated: true, completion: nil)
			
			return
		}
		let alertController = UIAlertController(title: myError.title, message: myError.localizedDescription, preferredStyle: .alert)
		alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
		
		self.present(alertController, animated: true, completion: nil)
	}
}

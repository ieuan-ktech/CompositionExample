//
//  UIControl+Setup.swift
//  CompositionExample
//
//  Created by Hayden Young on 18/09/2017.
//  Copyright © 2017 Chirone. All rights reserved.
//

import UIKit
struct UIControlTargetAction {
	var target: Any?
	var action: Selector
	var event: UIControlEvents
	
	init(target: Any?, action: Selector, event: UIControlEvents = .touchUpInside) {
		self.target = target
		self.action = action
		self.event = event
	}
}



struct UIControlConfiguration {
	var targetActions: [UIControlTargetAction] = [UIControlTargetAction]()
	
	init(targetActions: [UIControlTargetAction]?) {
		self.targetActions = targetActions ?? self.targetActions
	}
}

extension UIControl {

	convenience init(configuration: UIControlConfiguration) {
		self.init()
		
		set(configuration: configuration)
	}
	
	func set(configuration: UIControlConfiguration) {
		//--- Target Actions
		for config in configuration.targetActions {
			self.addTarget(config.target, action: config.action, for: config.event)
		}
	}

}

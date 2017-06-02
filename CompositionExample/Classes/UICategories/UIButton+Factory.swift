//
//  UIButton+Factory.swift
//  MVPComputerConfigurator
//
//  Created by Hayden Young on 17/05/2017.
//  Copyright © 2017 Chirone. All rights reserved.
//

import UIKit

struct UIButtonStateConfiguration {
	var state: UIControlState = .normal
	var title: String!
	var image: UIImage!
	var backgroundImage: UIImage!
	
	init() {
		
	}
	
	init(state: UIControlState = .normal, title: String! = nil, image: UIImage! = nil, backgroundImage: UIImage! = nil) {
		self.init()
		self.state = state
		self.title = title
		self.image = image
		self.backgroundImage = backgroundImage
	}
}

struct UIButtonActionConfiguration {
	var target: Any?
	var action: Selector!
	var controlEvent: UIControlEvents = .touchUpInside
	
	init() {
		target = nil
		action = nil
	}
	init(target: Any?, action: Selector, controlEvent: UIControlEvents = .touchUpInside) {
		self.init()
		self.target = target
		self.action = action
		self.controlEvent = controlEvent
	}
}

extension UIButton {
	
	convenience init(title: String, target: Any?, action: Selector) {
		let stateConfiguration = UIButtonStateConfiguration(title: title)
		let actionConfiguration = UIButtonActionConfiguration(target: target, action: action)
		
		self.init(stateConfigurations: [stateConfiguration], actionConfigurations: [actionConfiguration])
	}
	
	convenience init(stateConfigurations: Array<UIButtonStateConfiguration>, actionConfigurations: Array<UIButtonActionConfiguration>? = nil, font: UIFont = UIFont.systemFont(ofSize: 12), textColor: UIColor = .black, multilined: Bool = false) {
		self.init()
		
		//--- STATE CONFIGURATION
		for configuration in stateConfigurations {
			if configuration.title != nil {
				self.setTitle(configuration.title, for: configuration.state)
			}
			if configuration.image != nil {
				self.setImage(configuration.image, for: configuration.state)
			}
			if configuration.backgroundImage != nil {
				self.setBackgroundImage(configuration.backgroundImage, for: configuration.state)
			}
		}
		
		//--- ACTION CONFIGURATION
		guard let actionConfigs = actionConfigurations else {
			return
		}
		for configuration in actionConfigs {
			self.addTarget(configuration.target, action: configuration.action, for: configuration.controlEvent)
		}
		
		//--- LABEL
		self.titleLabel?.font = font
		self.titleLabel?.textColor = textColor
		
		if multilined {
			self.titleLabel?.numberOfLines = 0
			self.titleLabel?.lineBreakMode = .byWordWrapping
		}
		
		sizeToFit()
	}
	
}

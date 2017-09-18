//
//  UIButton+Factory.swift
//  MVPComputerConfigurator
//
//  Created by Hayden Young on 17/05/2017.
//  Copyright © 2017 Chirone. All rights reserved.
//
//
//
//	var loginButton: UIButton = {
//		let configuration = UIButtonConfiguration(titlesForStates: [UIButtonTitleState(title: "Push Me")],
//												  font: UIFont.systemFont(ofSize: 14),
//												  titleColorsForStates: [UIButtonColorState(color: .black)])
//		let button = UIButton(configuration: configuration)
//		return button
//	}()
//

import UIKit

struct UIButtonTitleState {
	var title: String?
	var state: UIControlState
	
	init(title: String?, state: UIControlState = .normal) {
		self.title = title
		self.state = state
	}
}

struct UIButtonAttributedTitleState {
	var attrTitle: NSAttributedString?
	var state: UIControlState
	
	init(attrTitle: NSAttributedString?, state: UIControlState = .normal) {
		self.attrTitle = attrTitle
		self.state = state
	}
}

struct UIButtonColorState {
	var color: UIColor?
	var state: UIControlState
	
	init(color: UIColor?, state: UIControlState = .normal) {
		self.color = color
		self.state = state
	}
}

struct UIButtonImageState {
	var image: UIImage?
	var state: UIControlState
	
	init(image: UIImage?, state: UIControlState = .normal) {
		self.image = image
		self.state = state
	}
}



struct UIButtonConfiguration {
	
	var titlesForStates: [UIButtonTitleState] = [UIButtonTitleState]()
	var attributedTitlesForStates: [UIButtonAttributedTitleState] = [UIButtonAttributedTitleState]()
	var font: UIFont = UIFont.systemFont(ofSize: 14)
	var titleColorsForStates: [UIButtonColorState] = [UIButtonColorState]()
	var imagesForStates: [UIButtonImageState] = [UIButtonImageState]()
	var backgroundImagesForStates: [UIButtonImageState] = [UIButtonImageState]()
	var labelConfiguration: UILabelConfiguration = UILabelConfiguration()
	
	var targetActions: [UIControlTargetAction] = [UIControlTargetAction]()
	
	init(titlesForStates: [UIButtonTitleState]? = nil,
	     attributedTitlesForStates: [UIButtonAttributedTitleState]? = nil,
	     font: UIFont? = nil,
	     titleColorsForStates: [UIButtonColorState]? = nil,
	     imagesForStates: [UIButtonImageState]? = nil,
	     backgroundImagesForStates: [UIButtonImageState]? = nil,
	     labelConfiguration: UILabelConfiguration? = nil,
	     targetActions: [UIControlTargetAction]? = nil) {
		
		self.titlesForStates = titlesForStates ?? self.titlesForStates
		self.attributedTitlesForStates = attributedTitlesForStates ?? self.attributedTitlesForStates
		self.font = font ?? self.font
		self.titleColorsForStates = titleColorsForStates ?? self.titleColorsForStates
		self.imagesForStates = imagesForStates ?? self.imagesForStates
		self.backgroundImagesForStates = backgroundImagesForStates ?? self.backgroundImagesForStates
		self.labelConfiguration = labelConfiguration ?? self.labelConfiguration
		self.targetActions = targetActions ?? self.targetActions
	}
}


extension UIButton {
	
	convenience init(configuration: UIButtonConfiguration) {
		self.init()
		
		set(configuration: configuration) 
	}
	
	func set(configuration: UIButtonConfiguration) {
		super.set(configuration: UIControlConfiguration(targetActions: configuration.targetActions))
		
		//--- Title
		for config in configuration.titlesForStates {
			setTitle(config.title, for: config.state)
		}
		
		//--- Attributed Title
		for config in configuration.attributedTitlesForStates {
			setAttributedTitle(config.attrTitle, for: config.state)
		}
		
		//--- Font
		titleLabel?.font = configuration.font
		
		//--- Title Colors
		for config in configuration.titleColorsForStates {
			setTitleColor(config.color, for: config.state)
		}
		
		//--- Images
		for config in configuration.imagesForStates {
			setImage(config.image, for: config.state)
		}
		
		//--- Background Images
		for config in configuration.backgroundImagesForStates {
			setImage(config.image, for: config.state)
		}
		
		//--- Label Configuration
		let labelConfig = configuration.labelConfiguration
		titleLabel?.numberOfLines = labelConfig.numberOfLines
		titleLabel?.textAlignment = labelConfig.textAlignment
		titleLabel?.lineBreakMode = labelConfig.lineBreakMode
		
		sizeToFit()
	}
}

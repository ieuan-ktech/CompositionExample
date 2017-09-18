//
//  UILabel+Factory.swift
//  MVPComputerConfigurator
//
//  Created by Hayden Young on 17/05/2017.
//  Copyright © 2017 Chirone. All rights reserved.
//
//
//
//	Example Usage:
//	Add label to view
//
//	func setupLabelOn(view: UIView) {
//		let label = UILabel(configuration: UILabelConfiguration(text: "Hello World!", font: UIFont.systemFont(ofSize: 24)))
//		view.addSubview(label)
//	}
//

import UIKit

struct UILabelConfiguration {
	var text: String?
	var textColor: UIColor = .black
	var font: UIFont = UIFont.systemFont(ofSize: 14)
	var numberOfLines: Int = 1
	var lineBreakMode: NSLineBreakMode = .byTruncatingTail
	var textAlignment: NSTextAlignment = .natural
	
	init(text: String? = nil,
	     textColor: UIColor? = nil,
	     font: UIFont? = nil,
	     numberOfLines: Int? = nil,
	     lineBreakMode: NSLineBreakMode? = nil,
	     textAlignment: NSTextAlignment? = nil) {
		
		self.text = text
		self.textColor = textColor ?? self.textColor
		self.font = font ?? self.font
		self.numberOfLines = numberOfLines ?? self.numberOfLines
		self.lineBreakMode = lineBreakMode ?? self.lineBreakMode
		self.textAlignment = textAlignment ?? self.textAlignment
	}
}

extension UILabel {
	
	convenience init(configuration: UILabelConfiguration) {
		self.init()
		
		text = configuration.text
		
		textColor = configuration.textColor
		
		font = configuration.font
		
		numberOfLines = configuration.numberOfLines
		
		lineBreakMode = configuration.lineBreakMode
		
		textAlignment = configuration.textAlignment
		
		sizeToFit()
	}
	
	
	
}


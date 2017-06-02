//
//  UILabel+Factory.swift
//  MVPComputerConfigurator
//
//  Created by Hayden Young on 17/05/2017.
//  Copyright © 2017 Nimbletank. All rights reserved.
//

import UIKit

extension UILabel {
	
	convenience init(text: String, font: UIFont = UIFont.systemFont(ofSize: 12), textColor: UIColor = .black, multilined: Bool = false) {
		self.init()
		
		self.text = text
		
		self.font = font
		
		self.textColor = textColor
		
		if multilined {
			self.numberOfLines = 0
			self.lineBreakMode = .byWordWrapping
		}
		
		sizeToFit()
	}
	
	convenience init(attributedText: NSAttributedString, multilined: Bool = false) {
		self.init()
		
		self.attributedText = attributedText
		
		if multilined {
			self.numberOfLines = 0
			self.lineBreakMode = .byWordWrapping
		}
		
		sizeToFit()
	}
	
}


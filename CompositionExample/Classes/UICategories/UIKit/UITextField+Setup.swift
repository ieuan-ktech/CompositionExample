//
//  UITextField+Setup.swift
//  CompositionExample
//
//  Created by Hayden Young on 18/09/2017.
//  Copyright © 2017 Chirone. All rights reserved.
//
//
//
//	Example Usage:
//	Add password text field to view
//
//	func setupTextFieldOn(view: UIView) {
//		let configurationType = UITextFieldConfiguration.Types.password(text: "password",
//																		placeholder: "Password",
//																		font: UIFont.systemFont(ofSize: 14))
//		let textField = UITextField(configurationType: configurationType)
//		view.addSubview(textField)
//	}
//


import UIKit


struct UITextFieldConfiguration {
	
	enum Types {
		case login(text: String?, placeholder: String?, font: UIFont?)
		case loginAttributed(text: NSAttributedString?, placeholder: NSAttributedString?)
		case password(text: String?, placeholder: String?, font: UIFont?)
		case passwordAttributed(text: NSAttributedString?, placeholder: NSAttributedString?)
		
		func configuration() -> UITextFieldConfiguration {
			switch self {
			case .login(let text, let placeholder, let font):
				return UITextFieldConfiguration(text: text, font: font, placeholder: placeholder, autocapitalizationType: .none, autocorrectionType: .no, spellCheckingType: UITextSpellCheckingType.no)
			case .loginAttributed(let text, let placeholder):
				return UITextFieldConfiguration(attributedText: text, attributedPlaceholder: placeholder, autocapitalizationType: .none, autocorrectionType: .no, spellCheckingType: UITextSpellCheckingType.no)
			case .password(let text, let placeholder, let font):
				return UITextFieldConfiguration(text: text, font: font, placeholder: placeholder, secureTextEntry: true)
			case .passwordAttributed(let text, let placeholder):
				return UITextFieldConfiguration(attributedText: text, attributedPlaceholder: placeholder, secureTextEntry: true)
//			default:
//				return UITextFieldConfiguration()
			}
			
		}
		
	}
	
	//--- text
	var text: String?
	var attributedText: NSAttributedString?
	var font: UIFont? // default is nil. use system font 12 pt
	var textAlignment: NSTextAlignment = .left // default is NSLeftTextAlignment
	var placeholder: String? // default is nil. string is drawn 70% gray
	var attributedPlaceholder: NSAttributedString? // default is nil
	
	//--- border
	var borderStyle: UITextBorderStyle = .none // default is UITextBorderStyleNone. If set to UITextBorderStyleRoundedRect, custom background images are ignored.
	
	//--- auto sizing
	var adjustsFontSizeToFitWidth = false // default is NO. if YES, text will shrink to minFontSize along baseline
	var minimumFontSize: CGFloat = 0.0 // default is 0.0. actual min may be pinned to something readable. used if adjustsFontSizeToFitWidth is YES
	
	//--- delegate
	var delegate: UITextFieldDelegate? // default is nil. weak reference
	
	//--- background
	var background: UIImage? // default is nil. draw in border rect. image should be stretchable
	var disabledBackground: UIImage? // default is nil. ignored if background not set. image should be stretchable
	
	//--- interaction behaviour
	var clearsOnBeginEditing = false // default is NO which moves cursor to location clicked. if YES, all text cleared
	var allowsEditingTextAttributes: Bool = false // default is NO. allows editing text attributes with style operations and pasting rich text
	var clearButtonMode: UITextFieldViewMode = .never // sets when the clear button shows up. default is UITextFieldViewModeNever
	
	//--- augmenting views
	var leftView: UIView? // e.g. magnifying glass
	var leftViewMode: UITextFieldViewMode = .never // sets when the left view shows up. default is UITextFieldViewModeNever
	var rightView: UIView? // e.g. bookmarks button
	var rightViewMode: UITextFieldViewMode = .never // sets when the right view shows up. default is UITextFieldViewModeNever
	var inputView: UIView?
	var inputAccessoryView: UIView?
	
	//--- input
	var autocapitalizationType: UITextAutocapitalizationType = .sentences
	var autocorrectionType: UITextAutocorrectionType = .default
	var spellCheckingType: UITextSpellCheckingType = .default
	var keyboardType: UIKeyboardType = .default
	var keyboardAppearance: UIKeyboardAppearance = .default
	var returnKeyType: UIReturnKeyType = .default
	var enablesReturnKeyAutomatically = false
	var secureTextEntry = false
	
	init(text: String? = nil,
	     attributedText: NSAttributedString? = nil,
	     font: UIFont? = nil,
	     textAlignment: NSTextAlignment = .left,
	     borderStyle: UITextBorderStyle = .none,
	     placeholder: String? = nil,
	     attributedPlaceholder: NSAttributedString? = nil,
	     clearsOnBeginEditing: Bool = false,
	     adjustsFontSizeToFitWidth: Bool = false,
	     minimumFontSize: CGFloat = 0.0,
	     delegate: UITextFieldDelegate? = nil,
	     background: UIImage? = nil,
	     disabledBackground: UIImage? = nil,
	     allowsEditingTextAttributes: Bool = false,
	     clearButtonMode: UITextFieldViewMode = .never,
	     leftView: UIView? = nil,
	     leftViewMode: UITextFieldViewMode = .never,
	     rightView: UIView? = nil,
	     rightViewMode: UITextFieldViewMode = .never,
	     inputView: UIView? = nil,
	     inputAccessoryView: UIView? = nil,
	     autocapitalizationType: UITextAutocapitalizationType = .sentences,
	     autocorrectionType: UITextAutocorrectionType = .default,
	     spellCheckingType: UITextSpellCheckingType = .default,
	     keyboardType: UIKeyboardType = .default,
	     keyboardAppearance: UIKeyboardAppearance = .default,
	     returnKeyType: UIReturnKeyType = .default,
	     enablesReturnKeyAutomatically: Bool = false,
	     secureTextEntry: Bool = false) {
		
		self.text = text
		self.attributedText = attributedText
		self.font = font
		self.textAlignment = textAlignment
		
		self.borderStyle = borderStyle
		
		self.placeholder = placeholder
		self.attributedPlaceholder = attributedPlaceholder
		self.clearsOnBeginEditing = clearsOnBeginEditing
		self.adjustsFontSizeToFitWidth = adjustsFontSizeToFitWidth
		self.minimumFontSize = minimumFontSize
		
		self.delegate = delegate
		
		self.background = background
		self.disabledBackground = disabledBackground
		
		self.allowsEditingTextAttributes = allowsEditingTextAttributes
		self.clearButtonMode = clearButtonMode
		
		self.leftView = leftView
		self.leftViewMode = leftViewMode
		
		self.rightView = rightView
		self.rightViewMode = rightViewMode
		
		self.inputView = inputView
		self.inputAccessoryView = inputAccessoryView
		
		self.autocapitalizationType = autocapitalizationType
		self.autocorrectionType = autocorrectionType
		self.spellCheckingType = spellCheckingType
		self.keyboardType = keyboardType
		self.keyboardAppearance = keyboardAppearance
		self.returnKeyType = returnKeyType;
		self.enablesReturnKeyAutomatically = enablesReturnKeyAutomatically
		self.secureTextEntry = secureTextEntry
	}
	
	
}

extension UITextField {
	
	convenience init(configurationType: UITextFieldConfiguration.Types) {
		self.init(configuration: configurationType.configuration())
	}
	
	convenience init(configuration: UITextFieldConfiguration) {
		self.init()
		
		set(configuration: configuration)
	}

	func set(configuration: UITextFieldConfiguration) {
		if let text = configuration.text {
			self.text = text
		}
		if let attributedText = configuration.attributedText {
			self.attributedText = attributedText
		}
		self.font = configuration.font
		self.textAlignment = configuration.textAlignment
		
		self.borderStyle = configuration.borderStyle
		
		if let placeholder = configuration.placeholder {
			self.placeholder = placeholder
		}
		if let attributedPlaceholder = configuration.attributedPlaceholder {
			self.attributedPlaceholder = attributedPlaceholder
		}
		self.clearsOnBeginEditing = configuration.clearsOnBeginEditing
		self.adjustsFontSizeToFitWidth = configuration.adjustsFontSizeToFitWidth
		self.minimumFontSize = configuration.minimumFontSize
		
		self.delegate = configuration.delegate
		
		self.background = configuration.background
		self.disabledBackground = configuration.disabledBackground
		
		self.allowsEditingTextAttributes = configuration.allowsEditingTextAttributes
		self.clearButtonMode = configuration.clearButtonMode
		
		self.leftView = configuration.leftView
		self.leftViewMode = configuration.leftViewMode
		
		self.rightView = configuration.rightView
		self.rightViewMode = configuration.rightViewMode
		
		self.inputView = configuration.inputView
		self.inputAccessoryView = configuration.inputAccessoryView
		
		self.autocapitalizationType = configuration.autocapitalizationType
		self.autocorrectionType = configuration.autocorrectionType
		self.spellCheckingType = configuration.spellCheckingType
		self.keyboardType = configuration.keyboardType
		self.keyboardAppearance = configuration.keyboardAppearance
		self.returnKeyType = configuration.returnKeyType;
		self.enablesReturnKeyAutomatically = configuration.enablesReturnKeyAutomatically
		self.isSecureTextEntry = configuration.secureTextEntry
		
		sizeToFit()
	}
}

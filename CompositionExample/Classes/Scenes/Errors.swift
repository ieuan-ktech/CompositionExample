//
//  Error.swift
//  MVPComputerConfigurator
//
//  Created by Hayden Young on 18/05/2017.
//  Copyright © 2017 Chirone. All rights reserved.
//

import Foundation
import Alamofire

extension Error {
	var code: Int {
		guard
			let error = self as? AFError,
			let responseCode = error.responseCode else {
				return (self as NSError).code
		}
		return responseCode
	}
	var domain: String { return (self as NSError).domain }
}

protocol MyError: Error {
	var localizedDescription: String { get }
	var title: String { get }
	
	
}

enum LoginError: MyError {
	
	case emptyFields
	case wrongCredentials
	case noAccessToken
	
	
	public var localizedDescription: String {
		get {
			switch self {
			case .emptyFields:
				return NSLocalizedString("error_login_empty_username_or_password", comment: "")
			case .wrongCredentials:
				return NSLocalizedString("error_login_wrong_username_or_password", comment: "")
			case .noAccessToken:
				return NSLocalizedString("error_token_non_existant", comment: "")
			}
		}
	}
	public var title: String {
		get {
			return NSLocalizedString("error_login_title", comment: "")
		}
	}
}



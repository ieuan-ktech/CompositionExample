//
//  MockAPIManager.swift
//  CompositionExample
//
//  Created by Hayden Young on 02/06/2017.
//  Copyright © 2017 Chirone. All rights reserved.
//

import UIKit

class MockAPIManager {
	var accessToken: String?
	
	public static let sharedInstance = MockAPIManager()
	private init() {
		
	}
}

extension MockAPIManager: LoginAPIProtocol {
	
	func getAuthTokenWith(username: String, password: String, completion: @escaping (_ request: URLRequest?, _ result: Any?, _ error: Error?) -> Void) {
		
		DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
			if username == "user" && password == "password" {
				let result = ["access_token": "0987654321"]
				completion(nil, result, nil)
			} else {
				let error = NSError(domain: "test", code: 403, userInfo: nil)
				completion(nil, nil, error)
			}
		}
		
		
	}
}

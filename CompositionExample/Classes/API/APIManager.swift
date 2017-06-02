//
//  APIManager.swift
//  MVPComputerConfigurator
//
//  Created by Hayden Young on 25/05/2017.
//  Copyright © 2017 Chirone. All rights reserved.
//

import Foundation
import Alamofire

class APIManager {
	var accessToken: String?
	
	public static let sharedInstance = APIManager()
	private init() {
		
	}
}

extension APIManager: LoginAPIProtocol {
	
	func getAuthTokenWith(username: String, password: String, completion: @escaping (_ request: URLRequest?, _ result: Any?, _ error: Error?) -> Void) {
		
		Alamofire.request(APIRouter.passwordAuth(username: username, password: password))
			.validate()
			.responseJSON(completionHandler: { response in
				completion(response.request, response.result.value, response.result.error)
			})
	}
}

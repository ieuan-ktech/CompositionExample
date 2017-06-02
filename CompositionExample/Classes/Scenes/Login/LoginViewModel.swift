//
//  LoginViewModel.swift
//  MVPComputerConfigurator
//
//  Created by Hayden Young on 18/05/2017.
//  Copyright © 2017 Chirone. All rights reserved.
//

import UIKit




class LoginViewModel: LoginViewModelProtocol {
	var loginAPI: LoginAPIProtocol?
	
	func loginWith(username: String, password: String, completion: @escaping (_: Error? ) -> Void) {
		
		if username.characters.count == 0 || password.characters.count == 0 {
			completion( LoginError.emptyFields )
			return
		}
		guard var loginAPI = loginAPI else { return }
		
		loginAPI.getAuthTokenWith(username: username, password: password, completion: { request, result, error in
			if let error = error {
				
				let errorCode = error.code
				if errorCode == 403 {
					completion( LoginError.wrongCredentials )
				} else {
					completion( error )
				}
				
				return
			}
			
			let responseJSON = result as! [String: AnyObject]
			guard let accessToken = responseJSON["access_token"] as? String else {
				completion( LoginError.noAccessToken )
				return;
			}
			//--- set the tokens
			loginAPI.accessToken = accessToken
			
			completion(nil)
		})
	}
	
}

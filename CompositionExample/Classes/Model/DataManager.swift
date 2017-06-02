//
//  DataManager.swift
//  CompositionExample
//
//  Created by Hayden Young on 02/06/2017.
//  Copyright © 2017 Chirone. All rights reserved.
//

import UIKit

class DataManager: DataManagerProtocol {

	public static let sharedInstance = DataManager()
	private init() {
		
	}
	
	var currentUser: User?
	
	func createUser(fromInfo info: Dictionary<String, Any>) -> User? {
		
		guard let firstName = info["first_name"] as? String,
			let lastName = info["last_name"] as? String else{
				return nil
		}
		
		let user = User()
		user.firstName = firstName
		user.lastName = lastName
		
		return user
	}
}


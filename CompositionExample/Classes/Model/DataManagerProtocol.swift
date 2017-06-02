//
//  DataManagerProtocol.swift
//  CompositionExample
//
//  Created by Hayden Young on 02/06/2017.
//  Copyright © 2017 Chirone. All rights reserved.
//

import UIKit

protocol DataManagerProtocol: class {

	var currentUser: User? { get set }
	func createUser(fromInfo info: Dictionary<String, Any>) -> User?
	
}

//
//  CompUserDataTests.swift
//  CompositionExample
//
//  Created by Hayden Young on 02/06/2017.
//  Copyright © 2017 Chirone. All rights reserved.
//

import XCTest

@testable import CompositionExample

class CompUserDataTests: XCTestCase {
	
	
	override func setUp() {
		super.setUp()
		//				viewModel.loginAPI = loginAPI
		// Put setup code here. This method is called before the invocation of each test method in the class.
	}
	
	override func tearDown() {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
		super.tearDown()
	}
	
	func testUserCreationMissingFields() {
		let dataManager = DataManager.sharedInstance
		let userInfo: [String: Any] = ["first_name": "John"]

		let user = dataManager.createUser(fromInfo: userInfo)
		
		XCTAssertNil(user)
	}
	
	func testUserCreationGoodInput() {
		let dataManager = DataManager.sharedInstance
		let userInfo: [String: Any] = ["first_name": "John",
		                               "last_name": "Snow"]
		
		let user = dataManager.createUser(fromInfo: userInfo)
		
		XCTAssertNotNil(user)
		XCTAssertEqual(user?.firstName, "John")
		XCTAssertEqual(user?.lastName, "Snow")
	}
}

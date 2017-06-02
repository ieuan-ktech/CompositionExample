//
//  MVPLoginTests.swift
//  MVPComputerConfigurator
//
//  Created by Hayden Young on 19/05/2017.
//  Copyright © 2017 Nimbletank. All rights reserved.
//

import XCTest

@testable import CompositionExample

class MVPLoginTests: XCTestCase {
//    let viewModel = LoginViewModel()
//		let loginAPI = APIManager.sharedInstance
	
    override func setUp() {
        super.setUp()
//				viewModel.loginAPI = loginAPI
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
	func testLoginEmptyFieldFailure() {
		let viewModel = LoginViewModel()
		let loginAPI = APIManager()//.sharedInstance
		viewModel.loginAPI = loginAPI
		
		var expectEmpty: XCTestExpectation? = expectation(description: "testing for empty fields")
		
		viewModel.loginWith(username: "", password: "", completion: { errorEmpty in
			
			guard let errorEmpty = errorEmpty else {
				XCTFail("Empty Login didn't error")
				expectEmpty?.fulfill()
				expectEmpty = nil
				return
			}
			
			XCTAssertEqual(errorEmpty as? LoginError, LoginError.emptyFields)
			expectEmpty?.fulfill()
			expectEmpty = nil
		})
		
		
		//--- when this test is in its own method the whole test unit fails even though the individual tests succeed when run independantly
		var expectWrongCred: XCTestExpectation? = expectation(description: "testing for incorrect credentials")
		
		viewModel.loginWith(username: "qwerty", password: "qwerty", completion: { error in
			
			guard let error = error else {
				XCTFail("Wrong Login didn't error")
				expectWrongCred?.fulfill()
				expectWrongCred = nil
				return
			}
			
			XCTAssertEqual(error as? LoginError, LoginError.wrongCredentials)
			expectWrongCred?.fulfill()
			expectWrongCred = nil
		})
		
		
		waitForExpectations(timeout: 2) { error in
			XCTAssertNil(error)
		}
	}
	
	func testLoginCorrectCredentials() {
		let viewModel = LoginViewModel()
		let loginAPI = APIManager()//.sharedInstance
		viewModel.loginAPI = loginAPI
		let expect = expectation(description: "Testing for correct credentials")
		
		viewModel.loginWith(username: "apptest2@kobaltmusic.com", password: "Rec0rd1ng", completion: { error in
			guard error == nil else {
				XCTFail("Login didn't succeed")
				expect.fulfill()
				return
			}
			
			expect.fulfill()
			
		})
		
		waitForExpectations(timeout: 10) { error in
			XCTAssertNil(error)
		}
	}
		
}


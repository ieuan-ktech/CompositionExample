//
//  APICollection.swift
//  MVPComputerConfigurator
//
//  Created by Hayden Young on 19/05/2017.
//  Copyright © 2017 Chirone. All rights reserved.
//

import UIKit
import Alamofire

public enum APIRouter: URLRequestConvertible {

	private static let baseURLPath = "https://www.google.com"
	static var accessToken: String?
	
	// --------------------------------------------------------------------------------------
	// MARK: - API End Points
	// --------------------------------------------------------------------------------------
	case passwordAuth(username: String, password: String)
	
	
	
	
	
	
	
	
	// --------------------------------------------------------------------------------------
	// MARK: - HTTP Types
	// --------------------------------------------------------------------------------------
	private var httpMethod: HTTPMethod {
		
		switch self {
		case .passwordAuth:
			return .post
		}
	}
	
	// --------------------------------------------------------------------------------------
	// MARK: - API Paths
	// --------------------------------------------------------------------------------------
	private var apiPath: String {
		switch self {
		case .passwordAuth:
			return "login"
		}
		
	}
	
	// --------------------------------------------------------------------------------------
	// MARK: - Parameters
	// --------------------------------------------------------------------------------------
	private var parameters: Dictionary<String, Any> {
		switch self {
		case .passwordAuth(let username, let password):
			return ["username": username,
							"password": password]
		}
		
	}
	
	// --------------------------------------------------------------------------------------
	// MARK: - URL Request
	// --------------------------------------------------------------------------------------
	public func asURLRequest() throws -> URLRequest {
		let parameters = self.parameters
		let url = try APIRouter.baseURLPath.asURL()
		var request = URLRequest(url: url.appendingPathComponent(self.apiPath))
		request.httpMethod = self.httpMethod.rawValue
		
		return try JSONEncoding.default.encode(request, with: parameters)
	}
	
	
}

//
//  API.swift
//  RaketaSampleCode
//
//  Created by hvk on 16.02.2021.
//

import Foundation

struct API {
    
    // MARK: - Public Methods
    
    static var shared: API = API()
    
    // MARK: - Private Properties
    
    private let urlComponents: URLComponents = .reddit
    private let urlSessionConfiguration: URLSessionConfiguration = .reddit
    private let urlSession: URLSession
    
    // MARK: - Initialization
    
    init() {
        urlSession = URLSession.init(configuration: .reddit)
    }
}

// MARK: - Reddit URLComponents

fileprivate extension URLComponents {
    
    static var reddit: URLComponents = {
        
        var urlcomponents = URLComponents()
        
        urlcomponents.scheme = "https"
        urlcomponents.host = "reddit.com"
//        urlcomponents.path = "top.json"
        
        return urlcomponents
    }()
}

// MARK: - URLSessionConfiguration

extension URLSessionConfiguration {
    
    static let reddit: URLSessionConfiguration = {
        
        let configuration = URLSessionConfiguration.background(withIdentifier: "top.com.reddit")
        
        configuration.sessionSendsLaunchEvents = false
        configuration.isDiscretionary = false
        configuration.allowsCellularAccess = true
        configuration.shouldUseExtendedBackgroundIdleMode = false
        configuration.waitsForConnectivity = true

        return configuration
    }()
}

// MARK: - Public Methods

extension API {
    
    public func responseDecodable<T: Decodable>(
        _ requestDataProvider: RequestDataProvider,
        completion: @escaping (_ response: Result<T, Error>) -> Void) {

        guard let request = requestDataProvider.request() else {
            return
        }
        
        let task = urlSession.dataTask(with: request) { (data, response, error) in
            
            let result = DecodableResponseParser<T>().parse(response: response as? HTTPURLResponse, data: data, error: error)
            completion(result)
        }
        
        task.resume()
    }
}

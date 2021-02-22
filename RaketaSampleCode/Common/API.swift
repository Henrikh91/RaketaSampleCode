//
//  API.swift
//  RaketaSampleCode
//
//  Created by hvk on 16.02.2021.
//

import Foundation

struct API {
    
    // MARK: - Constants
    
    private struct Constants {
        let timeoutInterval: TimeInterval = 60
    }
    
    // MARK: - Public Methods
    
    static var shared: API = API()
    
    // MARK: - Private Properties
    
    private let urlComponents: URLComponents = .reddit
    private let urlSessionConfiguration: URLSessionConfiguration = .reddit
    private let urlSession: URLSession
    
    // MARK: - Initialization
    
    init() {
        urlSession = URLSession(configuration: urlSessionConfiguration)
    }
}

// MARK: - URLSessionConfiguration

extension URLSessionConfiguration {
    
    static let reddit: URLSessionConfiguration = {
        
        let configuration = URLSessionConfiguration.default
        
        configuration.sessionSendsLaunchEvents = false
        configuration.isDiscretionary = false
        configuration.allowsCellularAccess = true
        configuration.shouldUseExtendedBackgroundIdleMode = true
        configuration.waitsForConnectivity = true
        configuration.requestCachePolicy = .useProtocolCachePolicy

        return configuration
    }()
}

// MARK: - Public Methods

extension API {
    
    func responseDecodable<T: Decodable>(
        _ requestDataProvider: RequestDataProvider,
        completion: @escaping (_ response: Result<T, Error>) -> Void) {

        guard let request = requestDataProvider.request() else {
            return
        }
        
        let task = urlSession.dataTask(with: request) { (data, response, error) in
            
            let result = DecodableResponseParser<T>().parse(response: response as? HTTPURLResponse, data: data, error: error)
            DispatchQueue.main.async {
                completion(result)
            }
        }
        
        task.resume()
    }
    
    func downloaded(from url: URL, completion: @escaping (_ response: Result<Data, Error>) -> Void) {
        
        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: Constants().timeoutInterval)
        
        request.httpMethod = HTTP.Method.get.rawValue
        
        urlSession.downloadTask(with: request) { (localURL, taskResponse, error) in
            
            guard
                error == nil,
                let localURL = localURL,
                let data = try? Data(contentsOf: localURL)
            else {
                completion(.failure(error!))
                return
            }

            completion(.success(data))
        }.resume()
    }
    
    func downloaded(from link: String?, completion: @escaping (_ response: Result<Data, Error>) -> Void) {
        
        guard
            let string = link,
            let url = URL(string: string)
        else {
            completion(.failure(NSError.init(domain: "", code: 0, userInfo: nil)))
            return
        }
        
        downloaded(from: url, completion: completion)
    }
}

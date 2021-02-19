//
//  URLRequest.swift
//  RaketaSampleCode
//
//  Created by hvk on 18.02.2021.
//

import Foundation

extension URLComponents {

    func request(by method: HTTP.Method, parameters: Parameters?) -> URLRequest? {
        
        var urlComponents = self
        
        switch method {
        
        case .get:
        
            if let parameters = parameters {
                
                urlComponents.queryItems = parameters.map {
                    URLQueryItem(name: $0.key, value: $0.value)
                }
            }
        }

        guard let url = urlComponents.url else {
            return nil
        }
        
        var urlrequest = URLRequest(url: url)

        urlrequest.httpMethod = method.rawValue
        
        return urlrequest
    }
}

//
//  RequestDataProvider.swift
//  RaketaSampleCode
//
//  Created by hvk on 18.02.2021.
//

import Foundation

public typealias Parameters = [String: String]

public protocol RequestDataProvider {

    var baseUrl: URL { get }
    var path: String { get }
    var method: HTTP.Method { get }
    var parameters: Parameters? { get }
}

public extension RequestDataProvider {

    var baseUrl: URL {
        URLComponents.reddit.url!
    }
    
    var method: HTTP.Method {
        return .get
    }

    var parameters: Parameters? {
        return nil
    }

    var url: URL {
        return baseUrl.absoluteURL.appendingPathComponent(path)
    }

    func request() -> URLRequest? {
        URLComponents(url: url, resolvingAgainstBaseURL: false)?.request(by: method, parameters: parameters)
    }
}

//
//  DecodableResponseParser.swift
//  RaketaSampleCode
//
//  Created by hvk on 18.02.2021.
//

import Foundation

public final class DecodableResponseParser<D: Decodable> {
    
    public typealias Parsable = D
    public typealias ParsingError = Error
    
    public init () {}
    
    public func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Result<Parsable, ParsingError> {
        
        guard error == nil else {
            return .failure(error!)
        }
        
        guard let data = data else {
            return .failure(NSError.init(domain: "", code: response?.statusCode ?? 0, userInfo: ["error": "data is null"]))
        }

        do {
            let item = try JSONDecoder().decode(D.self, from: data)
            
            return .success(item)
            
        } catch let error {
            return .failure(error)
        }
    }
}


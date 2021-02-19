//
//  TopList.API.swift
//  RaketaSampleCode
//
//  Created by hvk on 16.02.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

protocol TopListAPI {
    
    func loadTop(limit: String, after: String?, completion: @escaping (Result<TopList.Top, Error>) -> Void)
}

extension TopList {

    struct APIClient {

        enum Route: RequestDataProvider {
            
            case loadTop(limit: String, after: String?)

            var method: HTTP.Method {

                switch self {

                case .loadTop:
                    return .get
                }
            }

            var path: String {

                switch self {

                case .loadTop:
                    return "top.json"
                }
            }

            var parameters: Parameters? {

                switch self {

                case .loadTop(let limit, let after) :
                    return [
                        "limit": limit,
                        "after": after ?? ""
                    ]
                }
            }
        }
    }
}

// MARK: - TopListAPI

extension TopList.APIClient: TopListAPI {

    func loadTop(limit: String, after: String?, completion: @escaping (Result<TopList.Top, Error>) -> Void) {
       
        let request = Route.loadTop(limit: limit, after: after)
        
        API.shared.responseDecodable(request, completion: completion)
    }
}



//
//  TopList.Top.swift
//  RaketaSampleCode
//
//  Created by hvk on 19.02.2021.
//

import Foundation

extension TopList {

    // MARK: - Top
    
    struct Top: Codable {
        let data: TopListData
        
        // MARK: - Public Methods
        
        func entities() -> [Entity] {
            data.children.map { $0.data }
        }
    }
    
    // MARK: - TopListData
    
    struct TopListData: Codable {
        let children: [Child]
        let after: String
        let before: String?
    }
    
    // MARK: - Child
    
    struct Child: Codable {
        let kind: String
        let data: TopList.Entity
    }
}

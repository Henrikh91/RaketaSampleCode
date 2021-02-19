//
//  TopList.Entity.swift
//  RaketaSampleCode
//
//  Created by hvk on 16.02.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

extension TopList {
    
    struct Entity: Codable {
        let title: String // Title (at its full length, so take this into account when sizing your cells)
        let author: String // Author
        let created: Int // Entry date, following a format like "X hours ago"
        let thumbnail: String? // A thumbnail for those who have a picture
        let num_comments: Int // Number of comments
    }
}

// MARK: - ViewModel

extension TopList.Entity {

    struct ViewModel {

        // TODO: Create view model
    }
}

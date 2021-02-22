//
//  TopList.Entity.swift
//  RaketaSampleCode
//
//  Created by hvk on 16.02.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

extension TopList {
    
    struct Entity: Codable {
        let title: String // Title (at its full length, so take this into account when sizing your cells)
        let author: String // Author
        let created: Int // Entry date, following a format like "X hours ago"
        let thumbnail: String? // A thumbnail for those who have a picture
        let numberOfComments: Int // Number of comments
        
        private(set) var viewModel: TopListCell.ViewModel = .initial

        // MARK: - Codable
        
        enum CodingKeys: String, CodingKey {
            case title
            case author
            case created
            case thumbnail
            case numberOfComments = "num_comments"
        }
        
        // MARK: Public Methods

        mutating func updateViewModel(with dateComponentsFormatter: DateComponentsFormatter) {
            
            let timeAgo: String
            
            let offset = Date().timeIntervalSince1970 - TimeInterval(created)
            
            if let offsetString = dateComponentsFormatter.string(from: offset) {
                timeAgo = "\(offsetString) ago"
            } else {
                timeAgo = "Now"
            }
            
            self.viewModel =  TopListCell.ViewModel(title: "Title: \(title)",
                                   author: "Author: \(author)",
                                   timeAgo: "Entry date: \(timeAgo)",
                                   image: nil,
                                   comments: "Number of comments: \(numberOfComments)")
        }
        
        mutating func updateViewModel(with image: UIImage?) {
            self.viewModel.image = image
        }
    }
}

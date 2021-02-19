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
        let numberOfComments: Int // Number of comments
        
        // MARK: - Codable
        
        enum CodingKeys: String, CodingKey {
            case title
            case author
            case created
            case thumbnail
            case numberOfComments = "num_comments"
        }
        
        private(set) var viewModel: ViewModel = .initial
        
        // MARK: Public Methods
        
        mutating func updateViewModel(with dateComponentsFormatter: DateComponentsFormatter) {
            
            let timeAgo: String
            
            let offset = Date().timeIntervalSince1970 - TimeInterval(created)
            
            if let offsetString = dateComponentsFormatter.string(from: offset) {
                timeAgo = "\(offsetString) ago"
            } else {
                timeAgo = "Now"
            }
            
            var thumbnailURL: URL? = nil
            
            if let thumbnail = self.thumbnail {
                thumbnailURL = URL(string: thumbnail)
            }
            
            self.viewModel = ViewModel(title: "Title: \(self.title)",
                                       author: "Author: \(self.author)",
                                       timeAgo: "Entry date \(timeAgo)",
                                       imageURL: thumbnailURL,
                                       comments: "Number of comments \(numberOfComments)")
        }
    }
}

// MARK: - ViewModel

extension TopList.Entity {

    struct ViewModel {
        let title: String
        let author: String
        let timeAgo: String
        let imageURL: URL?
        let comments: String
        
        static var initial = ViewModel(title: "", author: "", timeAgo: "", imageURL: nil, comments: "")
    }
}

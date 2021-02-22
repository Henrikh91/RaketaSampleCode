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
        
//        enum RatingsCodingKeys: String, CodingKey {
//            case votesCount = "votes_count"
//            case averageRating = "average_rating"
//        }
        
//        func encode(to encoder: Encoder) throws {
//            var container = encoder.container(keyedBy: CodingKeys.self)
//            try container.encode(id, forKey: .id)
//            try container.encode(title, forKey: .title)
//            try container.encode(isOneToOne, forKey: .isOneToOne)
//            try container.encode(groupColor, forKey: .groupColor)
//            try container.encode(messagesCount, forKey: .messagesCount)
//            try container.encode(avatarImageId, forKey: .avatarImageId)
//            try container.encode(lastMessage, forKey: .lastMessage)
//            try container.encode(activeConference, forKey: .activeConference)
//            try container.encode(approval, forKey: .approval)
//            try container.encode(participants.toArray(), forKey: .participants)
//            try container.encode(type, forKey: .type)
//            try container.encode(initiatorContactId, forKey: .initiatorContactId)
//            try container.encode(accessRights, forKey: .accessRight)
//            try container.encode(roomStartDate, forKey: .roomStartDate)
//            try container.encode(roomEndDate, forKey: .roomEndDate)
//            try container.encode(welcomeMessage, forKey: .welcomeMessage)
//            try container.encode(isLoading, forKey: .isLoading)
//            try container.encode(lastUpdatedDate, forKey: .lastUpdatedDate)
//            try container.encode(isAllowOnlyAudio, forKey: .isAllowOnlyAudio)
//            try container.encode(isAllowConfirmJoinToRoom, forKey: .isAllowConfirmJoinToRoom)
//            try container.encode(invitedByDisplayName, forKey: .invitedByDisplayName)
//        }
//
//        required init(from decoder: Decoder) throws {
//
//            super.init()
//
//            let values = try decoder.container(keyedBy: CodingKeys.self)
//
//            self.messagesCount = try values.decode(Int.self, forKey: .messagesCount)
//            self.id = try values.decode(String.self, forKey: .id)
//            self.title = try values.decodeIfPresent(String.self, forKey: .title) ?? ""
//            self.isOneToOne = try values.decode(Bool.self, forKey: .isOneToOne)
//            self.groupColor = try values.decodeIfPresent(String.self, forKey: .groupColor) ?? ""
//            self.avatarImageId = try values.decodeIfPresent(String.self, forKey: .avatarImageId) ?? ""
//            self.lastMessage = try values.decodeIfPresent(LastMessage.self, forKey: .lastMessage) ?? LastMessage()
//            self.activeConference = try values.decodeIfPresent(ActiveConference.self, forKey: .activeConference) ?? ActiveConference()
//            self.approval = try values.decodeIfPresent(Int.self, forKey: .approval) ?? 0
//            self.initiatorContactId = try values.decodeIfPresent(String.self, forKey: .initiatorContactId) ?? ""
//            self.type = try values.decodeIfPresent(Int.self, forKey: .type) ?? 0
//
//            let participants = try values.decodeIfPresent([Participant].self, forKey: .participants) ?? []
//
//            self.participants.append(objectsIn: participants)
//
//            self.roomStartDate = try values.decodeIfPresent(String.self, forKey: .roomStartDate) ?? ""
//            self.roomEndDate = try values.decodeIfPresent(String.self, forKey: .roomEndDate) ?? ""
//            self.welcomeMessage = try values.decodeIfPresent(String.self, forKey: .welcomeMessage) ?? ""
//            self.isLoading = try values.decodeIfPresent(Bool.self, forKey: .isLoading) ?? false
//            self.lastUpdatedDate = try values.decodeIfPresent(String.self, forKey: .lastUpdatedDate) ?? ""
//            self.isAllowOnlyAudio = try values.decodeIfPresent(Bool.self, forKey: .isAllowOnlyAudio) ?? false
//            self.accessRights = try values.decodeIfPresent(ChatGroupAccessRights.self, forKey: .accessRight) ?? ChatGroupAccessRights()
//
//            self.invitedByDisplayName = try values.decodeIfPresent(String.self, forKey: .invitedByDisplayName) ?? ""
//        }
      
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

//// MARK: - ViewModel
//
//extension TopList.Entity {
//
//    struct ViewModel {
//        let title: String
//        let author: String
//        let timeAgo: String
//        let imageURL: URL?
//        let comments: String
//
//        static var initial = ViewModel(title: "", author: "", timeAgo: "", imageURL: nil, comments: "")
//    }
//}

//
//  TopListCell.swift
//  RaketaSampleCode
//
//  Created by hvk on 16.02.2021.
//

import UIKit

final class TopListCell: UITableViewCell {
    
    static var identifier: String {
        return String(describing: self)
    }

    // MARK: - IBOutlets

    @IBOutlet private(set) var titleLabel: UILabel!
    @IBOutlet private(set) var authorLabel: UILabel!
    @IBOutlet private(set) var dateLabel: UILabel!
    @IBOutlet private(set) var commentsLabel: UILabel!

    // MARK: ViewModel
    
    struct ViewModel {
        let title: String
        let author: String
        let timeAgo: String
        let imageURL: URL?
        let comments: String
        
        static var initial = ViewModel(title: "", author: "", timeAgo: "", imageURL: nil, comments: "")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        fill(with: .initial)
    }
}

// MARK: - DataView

extension TopListCell: DataView {
    
    typealias ViewModelType = ViewModel
    
    func fill(with viewModel: ViewModelType) {
        titleLabel?.text = viewModel.title
        authorLabel?.text = viewModel.author
        dateLabel?.text = viewModel.timeAgo
        commentsLabel?.text = viewModel.comments
        
        if let imageURL = viewModel.imageURL {
            imageView?.isHidden = false
            imageView?.downloaded(from: imageURL, contentMode: .scaleAspectFit)
        } else {
            imageView?.isHidden = true
            imageView?.image = nil
        }
    }
}

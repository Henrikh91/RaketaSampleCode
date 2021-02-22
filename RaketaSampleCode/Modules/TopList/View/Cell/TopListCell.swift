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

    // MARK: ViewModel
    
    struct ViewModel {
        let title: String
        let author: String
        let timeAgo: String
        var image: UIImage?
        let comments: String
        
        static var initial = ViewModel(title: "", author: "", timeAgo: "", image: nil, comments: "")
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
        textLabel?.text = viewModel.title
        detailTextLabel?.text = "\(viewModel.author)\n\(viewModel.timeAgo)\n\(viewModel.comments)"
        imageView?.image = viewModel.image
        imageView?.contentMode = .scaleAspectFit
    }
}

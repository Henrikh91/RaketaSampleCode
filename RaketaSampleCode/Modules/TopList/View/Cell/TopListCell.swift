//
//  TopListCell.swift
//  RaketaSampleCode
//
//  Created by hvk on 16.02.2021.
//

import UIKit

final class TopListCell: UITableViewCell {
    
    class var identifier: String {
        return String(describing: self)
    }
    
    // MARK: ViewModel
    
    struct ViewModel {
        let title: String
        let subtitle: String // author - entry date
        let imageURLString: String?
        let isHiddenImage: Bool
        
        static var initial = ViewModel(title: "", subtitle: "", imageURLString: nil, isHiddenImage: false)
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
        detailTextLabel?.text = viewModel.subtitle
        imageView?.isHidden = viewModel.isHiddenImage
        imageView?.downloaded(from: viewModel.imageURLString, contentMode: .scaleAspectFit)
    }
}

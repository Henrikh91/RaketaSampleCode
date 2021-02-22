//
//  TopList.Router.swift
//  RaketaSampleCode
//
//  Created by hvk on 16.02.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol TopListRouting {

    func showImageViewer(with thumbnail: String)
}

extension TopList {

    final class Router {

        // MARK: - Public properties

        weak var viewController: TopListViewController!
    }
}

// MARK: - Navigation

extension TopList.Router: TopListRouting {    
    
    func showImageViewer(with thumbnail: String) {
        
        let storyboard = UIStoryboard.init(name: String(describing: ImageViewer.self), bundle: .main)
        
        guard let viewController = storyboard.instantiateInitialViewController() as? ImageViewerViewController else {
            return
        }
        
        ImageViewer.Module().configure(viewController: viewController, thumbnail: thumbnail)
        
        self.viewController.present(viewController, animated: true)
    }
}

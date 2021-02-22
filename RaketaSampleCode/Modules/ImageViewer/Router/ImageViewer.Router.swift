//
//  ImageViewer.Router.swift
//  RaketaSampleCode
//
//  Created by hvk on 22.02.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol ImageViewerRouting {

    
}

extension ImageViewer {

    final class Router {

        // MARK: - Public properties

        weak var viewController: ImageViewerViewController!
    }
}

// MARK: - Navigation

extension ImageViewer.Router: ImageViewerRouting {    

}

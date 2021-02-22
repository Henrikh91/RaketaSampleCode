//
//  ImageViewer.Interactor.swift
//  RaketaSampleCode
//
//  Created by hvk on 22.02.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

protocol ImageViewerInteracting: AnyObject {

    
}

protocol ImageViewerInteractorOutput: AnyObject {

    
}

extension ImageViewer {

    final class Interactor {

        // MARK: - Public properties

        weak var output: ImageViewerInteractorOutput!

        // MARK: - Private properties

        private let api: ImageViewerAPI

        // MARK: - Init

        init(api: ImageViewerAPI = APIClient()) {
            self.api = api
        }
    }
}

// MARK: - Business logic

extension ImageViewer.Interactor: ImageViewerInteracting {

    
}

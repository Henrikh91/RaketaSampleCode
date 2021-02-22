//
//  ImageViewer.Module.swift
//  RaketaSampleCode
//
//  Created by hvk on 22.02.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

struct ImageViewer {}

extension ImageViewer {

    struct Module {

        func configure(viewController: ImageViewerViewController, thumbnail: String) {

            let router = Router()
            router.viewController = viewController

            let presenter = Presenter()
            presenter.view = viewController
            presenter.router = router
            presenter.thumbnail = thumbnail

            let interactor = Interactor()
            interactor.output = presenter

            presenter.interactor = interactor

            viewController.presenter = presenter
        }
    }
}

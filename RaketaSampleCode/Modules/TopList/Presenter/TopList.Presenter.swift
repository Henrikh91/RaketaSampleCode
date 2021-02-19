//
//  TopList.Presenter.swift
//  RaketaSampleCode
//
//  Created by hvk on 16.02.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol TopListPresenting: AnyObject {

    func viewDidLoad()
}

extension TopList {

    final class Presenter {

        // MARK: - Public properties

        weak var view: TopListView!
        var router: TopListRouting!
        var interactor: TopListInteracting!
    }
}

// MARK: - Presentation logic

extension TopList.Presenter: TopListPresenting {

    func viewDidLoad() {

        // TODO: Present something in view or call some method on interactor

        // router.navigateToSomewhere()
    }
}

// MARK: - TopListInteractorOutput

extension TopList.Presenter: TopListInteractorOutput {

    
}

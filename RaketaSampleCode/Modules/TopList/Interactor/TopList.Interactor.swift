//
//  TopList.Interactor.swift
//  RaketaSampleCode
//
//  Created by hvk on 16.02.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

protocol TopListInteracting: AnyObject {

    
}

protocol TopListInteractorOutput: AnyObject {

    
}

extension TopList {

    final class Interactor {

        // MARK: - Public properties

        weak var output: TopListInteractorOutput!

        // MARK: - Private properties

        private let api: TopListAPI

        // MARK: - Init

        init(api: TopListAPI = APIClient()) {
            self.api = api
        }
    }
}

// MARK: - Business logic

extension TopList.Interactor: TopListInteracting {

    
}

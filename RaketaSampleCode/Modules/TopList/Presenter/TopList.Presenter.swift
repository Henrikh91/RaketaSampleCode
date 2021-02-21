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

    final class Presenter <Interactor: TopListInteracting> where Interactor.Item == Entity {

        // MARK: - Public properties

        weak var view: TopListView!
        var router: TopListRouting!
        var interactor: Interactor!
    }
}

// MARK: - Presentation logic

extension TopList.Presenter: TopListPresenting {

    func viewDidLoad() {
        interactor.loadItems()
    }
}

// MARK: - TopListInteractorOutput

extension TopList.Presenter: TopListInteractorOutput {
    
    func didStartLoadingItems() {
        // view?.showLoader()
    }
    
    func didLoadItems(at indexPaths: [IndexPath]) {
        // view?.hideLoader()
        
        if indexPaths.isEmpty {
            view?.reloadData()
        } else {
            view?.insertRows(at: indexPaths, with: .none)
        }
    }
    
    func didFailLoadItems(with error: Error) {
        view?.showErrorAlert(with: error.localizedDescription)
    }
    
    func didStartRefreshingItems() { }
    
    func didRefreshItems() {
        view?.hideRefreshLoader()
        view?.reloadData()
    }
    
    func didFailToRefreshItems(with error: Error) {
        view?.hideRefreshLoader()
        view?.showErrorAlert(with: error.localizedDescription)
    }
}

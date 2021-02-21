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
    
    func numberOfSections() -> Int
    func numberOfItems(in section: Int) -> Int
    func item(at indexPath: IndexPath) -> TopListCell.ViewModel

    func didSelectItem(at indexPath: IndexPath)
    
    func didSwipeRefresh()
    
    func loadNextPage()
}

extension TopList {

    final class Presenter <Interactor: TopListInteracting> where Interactor.Item == Entity {

        // MARK: - Public properties

        weak var view: TopListView!
        var router: TopListRouting!
        var interactor: Interactor!
        
        // MARK: - Private Properties
        
        private var isLoadingItems: Bool = false
    }
}

// MARK: - Presentation logic

extension TopList.Presenter: TopListPresenting {

    func viewDidLoad() {
        interactor.loadItems()
    }
    
    func numberOfSections() -> Int {
        return interactor.numberOfSections()
    }
    
    func numberOfItems(in section: Int) -> Int {
        return interactor.numberOfItems(in: section)
    }
        
    func item(at indexPath: IndexPath) -> TopListCell.ViewModel {
        return interactor.item(at: indexPath).viewModel
    }
    
    func didSelectItem(at indexPath: IndexPath) {
        
//        let item = interactor.item(at: indexPath)
//        
//        view?.deselectCell(at: indexPath, withAnimation: true)
    }
    
    func didSwipeRefresh() {
        interactor.refreshItems()
    }

    func loadNextPage() {
        
        guard isLoadingItems == false else {
            return
        }
        
        interactor.loadItems()
    }
}

// MARK: - TopListInteractorOutput

extension TopList.Presenter: TopListInteractorOutput {
    
    func didStartLoadingItems() {
        // view?.showLoader()
        isLoadingItems = true
    }
    
    func didLoadItems(at indexPaths: [IndexPath]) {
        isLoadingItems = false
        // view?.hideLoader()
        
        if indexPaths.isEmpty {
            view?.reloadData()
        } else {
            view?.insertRows(at: indexPaths, with: .none)
        }
    }
    
    func didFailLoadItems(with error: Error) {
        isLoadingItems = false
        view?.showErrorAlert(with: error.localizedDescription)
    }
    
    func didStartRefreshingItems() {
        isLoadingItems = true
    }
    
    func didRefreshItems() {
        isLoadingItems = false
        view?.hideRefreshLoader()
        view?.reloadData()
    }
    
    func didFailToRefreshItems(with error: Error) {
        isLoadingItems = false
        view?.hideRefreshLoader()
        view?.showErrorAlert(with: error.localizedDescription)
    }
}

//
//  TopList.Interactor.swift
//  RaketaSampleCode
//
//  Created by hvk on 16.02.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

protocol TopListInteracting: RefreshableListInteractor {

    func loadItems()
}

protocol TopListInteractorOutput: AnyObject {

    func didStartLoadingItems()
    func didLoadItems()
    func didFailLoadItems(with error: Error)
}

extension TopList {

    final class Interactor {
        
        // MARK: - Constants
        
        private struct Constants {
            let limit: String = "20"
        }

        // MARK: - Public properties

        weak var output: TopListInteractorOutput!

        // MARK: - Private properties

        private let api: TopListAPI
        private var entities: [Entity] = []
        private var after: String?

        // MARK: - Init

        init(api: TopListAPI = APIClient()) {
            self.api = api
        }
    }
}

// MARK: - Private Methods

extension TopList.Interactor {
    
    
}

// MARK: - Business logic

extension TopList.Interactor: TopListInteracting {
    
    typealias Item = TopList.Entity
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfItems(in section: Int) -> Int {
        return entities.count
    }
    
    func item(at indexPath: IndexPath) -> Item {
        return entities[indexPath.row]
    }
    
    func indexPath(where predicate: (Item) -> Bool) -> IndexPath? {

        guard let index = entities.firstIndex(where: predicate) else {
            return nil
        }
        
        return IndexPath(row: index, section: 0)
    }
    
    func loadItems() {
        
        output?.didStartLoadingItems()
        
        let constants = Constants()
        
        api.loadTop(limit: constants.limit, after: after) { [weak self] (result) in guard let self = self else { return }
            
            switch result {
            
            case .success(let item):
                
                self.after = item.after()
                self.entities.append(contentsOf: self.entities)
                
                self.output.didLoadItems()
                
            case .failure(let error):
                self.output?.didFailLoadItems(with: error)
            }
        }
    }
}

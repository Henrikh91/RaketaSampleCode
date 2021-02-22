//
//  TopList.Interactor.swift
//  RaketaSampleCode
//
//  Created by hvk on 16.02.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol TopListInteracting: RefreshableListInteractor {

    func loadItems()
    
    func update(thumbnailImage: UIImage?, atIndexPath: IndexPath)
}

protocol TopListInteractorOutput: RefreshableListInteractorOutput {

    func didStartLoadingItems()
    func didLoadItems(at indexPaths: [IndexPath])
    func didFailLoadItems(with error: Error)
    
    func didUpdate(at indexPath: IndexPath)
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
        private let dateComponentsFormatter: DateComponentsFormatter

        // MARK: - Init

        init(api: TopListAPI = APIClient()) {
            self.api = api
            
            self.dateComponentsFormatter = DateComponentsFormatter()
            self.dateComponentsFormatter.allowedUnits = [.day, .hour, .minute, .second ]
            self.dateComponentsFormatter.maximumUnitCount = 1
            self.dateComponentsFormatter.unitsStyle = .full
        }
    }
}

// MARK: - Private Methods

extension TopList.Interactor {
    
    func loadTop(success: @escaping () -> Void, fail: @escaping (Error) -> Void) {
        
        let constants = Constants()
        
        api.loadTop(limit: constants.limit, after: after) { [weak self] (result) in
            
            guard let self = self else {
                return
            }
            
            switch result {
            
            case .success(let item):
                
                self.after = item.after()
                
                var itemEntities = item.entities()
                
                for index in 0..<itemEntities.count {
                    itemEntities[index].updateViewModel(with: self.dateComponentsFormatter)
                }
                                
                self.entities.append(contentsOf: itemEntities)
                
                success()
                
            case .failure(let error):
                fail(error)
            }
        }
    }
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
        
        let endIndex: Int? = entities.isEmpty ? nil : entities.endIndex
        
        loadTop { [weak self] in
            
            guard let self = self else {
                return
            }
            
            var indexPaths: [IndexPath] = []
            
            if let oldEndIndex = endIndex {
                
                for index in oldEndIndex..<self.entities.endIndex {
                    
                    let indexPath = IndexPath(row: index, section: 0)
                    
                    indexPaths.append(indexPath)
                }
            }
            
            self.output.didLoadItems(at: indexPaths)
            
        } fail: { [weak self] (error) in
            self?.output.didFailLoadItems(with: error)
        }
    }
    
    func update(thumbnailImage: UIImage?, atIndexPath: IndexPath) {
        entities[atIndexPath.row].updateViewModel(with: thumbnailImage)
        
        output?.didUpdate(at: atIndexPath)
    }
    
    func refreshItems() {
        
        output.didStartRefreshingItems()
        
        after = nil
        entities.removeAll()
        
        loadTop { [weak self] in
            self?.output.didRefreshItems()
        } fail: { [weak self] (error) in
            self?.output.didFailToRefreshItems(with: error)
        }
    }
}

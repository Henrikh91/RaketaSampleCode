//
//  ListInteractor.swift
//  RaketaSampleCode
//
//  Created by hvk on 19.02.2021.
//

import Foundation

protocol ListInteractor: AnyObject {
    
    associatedtype Item
    
    // MARK: - DataSource
    
    func numberOfSections() -> Int
    func numberOfItems(in section: Int) -> Int
    func item(at indexPath: IndexPath) -> Item
    func indexPath(where predicate: (Item) -> Bool) -> IndexPath?
    func totalItems() -> Int
}

extension ListInteractor {
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func indexPath(where predicate: (Item) -> Bool) -> IndexPath? {
        return nil
    }
    
    func totalItems() -> Int {
        
        let numberOfSections = self.numberOfSections()
        
        var total: Int = 0
        
        for section in 0..<numberOfSections {
            total += numberOfItems(in: section)
        }
        
        return total
    }
}


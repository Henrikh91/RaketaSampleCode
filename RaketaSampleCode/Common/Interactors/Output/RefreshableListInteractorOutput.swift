//
//  RefreshableListInteractorOutput.swift
//  RaketaSampleCode
//
//  Created by hvk on 19.02.2021.
//

import Foundation

protocol RefreshableListInteractorOutput: AnyObject {
    
    func didStartRefreshingItems()
    func didRefreshItems()
    func didFailToRefreshItems(with error: Error)
}

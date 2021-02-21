//
//  ViewWithRefreshLoader.swift
//  RaketaSampleCode
//
//  Created by hvk on 21.02.2021.
//

import UIKit

public protocol ViewWithRefreshLoader: class {
    
    var refreshControl: UIRefreshControl { get }
    
    func showRefreshLoader()
    func hideRefreshLoader()
}

public extension ViewWithRefreshLoader {
    
    func showRefreshLoader() {
        refreshControl.beginRefreshing()
    }
    
    func hideRefreshLoader() {
        refreshControl.endRefreshing()
    }
}


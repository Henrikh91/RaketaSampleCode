//
//  TopList.Router.swift
//  RaketaSampleCode
//
//  Created by hvk on 16.02.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol TopListRouting {

    
}

extension TopList {

    final class Router {

        // MARK: - Public properties

        weak var viewController: TopListViewController!
    }
}

// MARK: - Navigation

extension TopList.Router: TopListRouting {    

}

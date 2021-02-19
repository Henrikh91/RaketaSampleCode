//
//  TopListViewController.swift
//  RaketaSampleCode
//
//  Created by hvk on 16.02.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class TopListViewController: UIViewController {

    // MARK: - Public properties

    var presenter: TopListPresenting!

    // MARK: - Object lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
        TopList.Module().configure(viewController: self)
    }

    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // TODO: Ask the Presenter to do some work
        presenter.viewDidLoad()
    }
}

// MARK: - View logic

extension TopListViewController: TopListView {

}

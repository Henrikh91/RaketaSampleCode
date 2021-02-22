//
//  TopListViewController.swift
//  RaketaSampleCode
//
//  Created by hvk on 16.02.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class TopListViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet private(set) var tableView: UITableView!

    // MARK: - Public properties

    var presenter: TopListPresenting!
    
    lazy var refreshControl: UIRefreshControl = {
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(didSwipeRefreshContacts), for: .valueChanged)

        return refreshControl
    }()
    
    // MARK: - Object lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
        TopList.Module().configure(viewController: self)
    }

    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.refreshControl = refreshControl

        presenter.viewDidLoad()
    }
}

// MARK: - IBActions

extension TopListViewController {
    
    @IBAction func didSwipeRefreshContacts() {
        presenter.didSwipeRefresh()
    }
}

// MARK: - View logic

extension TopListViewController: TopListView { }

// MARK: - UITableViewDataSource

extension TopListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfItems(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let viewModel = presenter.item(at: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: TopListCell.identifier, for: indexPath) as! TopListCell
        
        cell.fill(with: viewModel)
        
        presenter.viewDidLoadCell(at: indexPath)
        
        return cell
    }
}

// MARK: - UITableViewDataSource

extension TopListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectItem(at: indexPath)
    }
}

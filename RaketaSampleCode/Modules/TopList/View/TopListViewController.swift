//
//  TopListViewController.swift
//  RaketaSampleCode
//
//  Created by hvk on 16.02.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class TopListViewController: UIViewController {

//    private struct ListOfContactsConstants {
//        let contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 8, right: 0)
//    }

    // MARK: - IBOutlets
    
    @IBOutlet private(set) var tableView: UITableView!

    // MARK: - Public properties

    var presenter: TopListPresenting!
    
    lazy var refreshControl: UIRefreshControl = {
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(didSwipeRefreshContacts), for: .valueChanged)

        tableView.refreshControl = refreshControl

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
        
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if scrollView.contentOffset.y + scrollView.frame.size.height > scrollView.contentSize.height {
            presenter.loadNextPage()
        }
    }
}

// MARK: - UITableViewDataSource

extension TopListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectItem(at: indexPath)
    }
}

//
//  ViewWithReloadTable.swift
//  RaketaSampleCode
//
//  Created by hvk on 21.02.2021.
//

import UIKit

protocol ViewWithReloadTable: AnyObject {
    
    var tableView: UITableView! { get }
    
    func reloadData()
    func reloadCell(at indexPaths: [IndexPath], with animation: UITableView.RowAnimation?)
    func reloadSections(at indexSet: IndexSet, with animation: UITableView.RowAnimation?)

    func selectCell(at indexPath: IndexPath, withAnimation animation: Bool)
    func deselectCell(at indexPath: IndexPath, withAnimation animation: Bool)
    
    func deleteSection(at section: Int, with animation: UITableView.RowAnimation?)
    func deleteCells(at indexPaths: [IndexPath], with animation: UITableView.RowAnimation?)

    func insertSections(at indexSet: IndexSet, with animation: UITableView.RowAnimation)
    func insertRows(at indexPaths: [IndexPath], with animation: UITableView.RowAnimation)

    func moveCell(fromIndexPath: IndexPath, toIndexPath: IndexPath)

    func scrollToRow(at indexPath: IndexPath, atPosition position: UITableView.ScrollPosition, animated: Bool)
    
    func performBatchUpdates(_ updates: (() -> Void)?, completion: ((Bool) -> Void)?)
}

extension ViewWithReloadTable {
    
    func reloadData() {
        tableView?.reloadData()
    }
    
    func reloadCell(at indexPaths: [IndexPath], with animation: UITableView.RowAnimation? = nil) {
        tableView?.reloadRows(at: indexPaths, with: animation ?? .none)
    }

    func reloadSections(at indexSet: IndexSet, with animation: UITableView.RowAnimation? = nil) {
        tableView?.reloadSections(indexSet, with: animation ?? .fade)
    }

    func selectCell(at indexPath: IndexPath, withAnimation animation: Bool) {
        tableView?.selectRow(at: indexPath, animated: true, scrollPosition: .none)
    }

    func deselectCell(at indexPath: IndexPath, withAnimation animation: Bool) {
        tableView?.deselectRow(at: indexPath, animated: animation)
    }
    
    func deleteSection(at section: Int, with animation: UITableView.RowAnimation? = nil) {
        tableView?.deleteSections([section], with: animation ?? .left)
    }
    
    func deleteCells(at indexPaths: [IndexPath], with animation: UITableView.RowAnimation? = nil) {
        tableView?.deleteRows(at: indexPaths, with: animation ?? .left)
    }

    func insertSections(at indexSet: IndexSet, with animation: UITableView.RowAnimation) {
        tableView?.insertSections(indexSet, with: animation)
    }
    
    func insertRows(at indexPaths: [IndexPath], with animation: UITableView.RowAnimation) {
        tableView?.insertRows(at: indexPaths, with: animation)
    }
    
    func moveCell(fromIndexPath: IndexPath, toIndexPath: IndexPath) {
        tableView?.moveRow(at: fromIndexPath, to: toIndexPath)
    }
    
    func scrollToRow(at indexPath: IndexPath, atPosition position: UITableView.ScrollPosition, animated: Bool) {
        tableView?.scrollToRow(at: indexPath, at: position, animated: animated)
    }
    
    func performBatchUpdates(_ updates: (() -> Void)?, completion: ((Bool) -> Void)? = nil) {
        tableView?.performBatchUpdates(updates, completion: completion)
    }
}

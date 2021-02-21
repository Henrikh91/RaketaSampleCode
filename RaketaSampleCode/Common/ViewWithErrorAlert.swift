//
//  ViewWithErrorAlert.swift
//  RaketaSampleCode
//
//  Created by hvk on 19.02.2021.
//

import UIKit

protocol ViewWithErrorAlert: AnyObject {
    func showAlert(with message: String, title: String?)
    func showErrorAlert(with message: String)
    func showAlert(title: String?, message: String?, actions: [UIAlertAction]?, preferredStyle: UIAlertController.Style?)
    func showAlert(title: String?, message: String?, stringActions: [String]?, preferredStyle: UIAlertController.Style?)
}

extension ViewWithErrorAlert {
    
    func showAlert(with message: String, title: String? = nil) {
        UIAlertController.show(title: title, message: message)
    }
    
    func showErrorAlert(with message: String) {
        UIAlertController.show(title: "Error", message: message)
    }
    
    func showAlert(title: String? = nil, message: String? = nil, actions: [UIAlertAction]? = nil, preferredStyle: UIAlertController.Style?) {
        UIAlertController.show(title: title, message: message, actions: actions, preferredStyle: preferredStyle ?? .alert)
    }

    func showAlert(title: String? = nil, message: String? = nil, stringActions: [String]? = nil, preferredStyle: UIAlertController.Style?) {
        UIAlertController.show(title: title, message: message, stringActions: stringActions, preferredStyle: preferredStyle ?? .alert)
    }
}

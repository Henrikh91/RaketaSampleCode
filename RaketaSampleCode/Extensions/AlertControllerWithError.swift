//
//  AlertControllerWithError.swift
//  RaketaSampleCode
//
//  Created by hvk on 19.02.2021.
//

import UIKit

extension UIAlertController {
    
    class func show(title: String?, message: String, actions: [UIAlertAction]? = nil) {
        show(title: title, message: message, actions: actions, preferredStyle: .alert)
    }

    class func show(title: String? = nil, message: String? = nil, actions: [UIAlertAction]? = nil, preferredStyle: UIAlertController.Style = .alert) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        
        if actions == nil {
            let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
            
            alertController.addAction(action)
            
        } else if let actions = actions {
            
            actions.forEach { (action) in
                alertController.addAction(action)
            }
        }

        guard let topViewController = UIApplication.topViewController() else {
            return
        }
                
        topViewController.present(alertController, animated: true, completion: nil)
    }

    class func show(title: String? = nil, message: String? = nil, stringActions: [String]? = nil, preferredStyle: UIAlertController.Style = .alert) {

        if let actions = stringActions {
            
            let alertActions = actions.map { (title) -> UIAlertAction in
                
                let action = UIAlertAction(title: title, style: .default, handler: nil)
                
                return action
            }
            
            show(title: title, message: message, actions: alertActions, preferredStyle: preferredStyle)
            
        } else {
            show(title: title, message: message, actions: nil, preferredStyle: preferredStyle)
        }
    }

    class func showError(with message: String, actions: [UIAlertAction]? = nil) {
        show(title: "Error", message: message, actions: actions)
    }
}


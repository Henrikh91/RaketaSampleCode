//
//  ApplicationWithTopController.swift
//  RaketaSampleCode
//
//  Created by hvk on 19.02.2021.
//

import UIKit

extension UIApplication {
        
    static func topViewController(_ base: UIViewController? = nil) -> UIViewController? {
        
        let viewController = base ?? UIApplication.shared.windows.first(where: { $0.isKeyWindow })?.rootViewController
        
        if let nav = viewController as? UINavigationController {
            return topViewController(nav.visibleViewController)
        }
        
        if let tab = viewController as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(selected)
            }
        }
        
        if let presented = viewController?.presentedViewController {
            return topViewController(presented)
        }
        
        return viewController
    }
    
    static func appDelegate() -> AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
}

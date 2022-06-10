//
//  UIApplication+Extensions.swift
//  Words-Booster-iOS-TestTask
//
//  Created by Dmitriy Dmitriyev on 10.06.2022.
//

import Foundation
import UIKit

extension UIApplication {
    
    static func topViewController(firstPresented: Bool = false, fromController controller: UIViewController? = UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.rootViewController) -> UIViewController? {
        if let presented = controller?.presentedViewController {
            return firstPresented ? presented : topViewController(fromController: presented)
        }
        if let navigationController = controller as? UINavigationController {
            return topViewController(fromController: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(fromController: selected)
            }
        }
        if let splitViewController = controller as? UISplitViewController {
            for vc in splitViewController.viewControllers {
                return topViewController(fromController: vc)
            }
        }
        
        return controller
    }
    
    static func topPresentedViewController(fromController controller: UIViewController? = UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.rootViewController) -> UIViewController? {
        guard let rootViewController = controller else {
            return nil
        }
        
        var topController = rootViewController
        
        while let newTopController = topController.presentedViewController {
            topController = newTopController
        }
        
        return topController
    }
    
}

//
//  CategoriesListRouter.swift
//  Words-Booster-iOS-TestTask
//
//  Created by Dmitriy Dmitriyev on 10.06.2022.
//

import Foundation
import UIKit

class CategoriesListRouter {
    
    private let alertService = AlertService()
    
    var topVC: UIViewController? {
        return UIApplication.topViewController()
    }
    
    func startFactsFlow(for category: Category) {
        guard let content = category.content, !content.isEmpty else {
            showComingSoonAlert()
            return
        }
        
        if category.status == .free {
            let storyboard = UIStoryboard(name: "FactsViewController", bundle: nil)
            guard let vc = storyboard.instantiateViewController(withIdentifier: "FactsViewControllerId") as?  FactsViewController else { return }
            vc.category = category
            
            topVC?.navigationController?.pushViewController(vc, animated: true)
        } else {
            startPaidFlow(for: category)
        }
        
    }
    
    private func showComingSoonAlert() {
        alertService.presentAlertWithTitle(title: "Coming soon",
                                           message: "",
                                           options: ["OK"]) { _ in
        }
    }
    
    private func startPaidFlow(for category: Category) {
        alertService.presentAlertWithTitle(title: "Watch Ad to continue",
                                           message: "",
                                           options: ["Cancel", "Show"]) { [weak self] res in
            switch res {
            case 0: break
            case 1:
                self?.topVC?.startIndicatingActivity()
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    self?.topVC?.stopIndicatingActivity()
                    let storyboard = UIStoryboard(name: "FactsViewController", bundle: nil)
                    guard let vc = storyboard.instantiateViewController(withIdentifier: "FactsViewControllerId") as?  FactsViewController else { return }
                    vc.category = category
                    
                    self?.topVC?.navigationController?.pushViewController(vc, animated: true)
                }
            default: break
            }
        }
    }
    
}

//
//  FactsRouter.swift
//  Words-Booster-iOS-TestTask
//
//  Created by Dmitriy Dmitriyev on 10.06.2022.
//

import Foundation
import UIKit

class FactsRouter {
    
    private let alertService = AlertService()
    
    var topVC: UIViewController? {
        return UIApplication.topViewController()
    }
    
    func back() {
        topVC?.navigationController?.popViewController(animated: true)
    }
    
}


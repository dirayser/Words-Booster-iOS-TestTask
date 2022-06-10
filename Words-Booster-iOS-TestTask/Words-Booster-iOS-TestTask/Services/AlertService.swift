//
//  AlertService.swift
//  Words-Booster-iOS-TestTask
//
//  Created by Dmitriy Dmitriyev on 10.06.2022.
//

import Foundation
import UIKit

class AlertService {
    
    var topVC: UIViewController? {
        return UIApplication.topViewController()
    }
    
    func presentAlertWithTitle(title: String, message: String, options: [String], completion: @escaping (Int) -> Void) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for (index, option) in options.enumerated() {
            alertController.addAction(UIAlertAction.init(title: option, style: .default, handler: { (action) in
                completion(index)
            }))
        }
        
        topVC?.present(alertController, animated: true, completion: nil)
    }
    
}

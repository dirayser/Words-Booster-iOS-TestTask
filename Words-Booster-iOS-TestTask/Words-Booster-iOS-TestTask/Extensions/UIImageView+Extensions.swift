//
//  UIImageView+Extensions.swift
//  Words-Booster-iOS-TestTask
//
//  Created by Dmitriy Dmitriyev on 10.06.2022.
//

import UIKit

extension UIImageView {
    
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit, completion: ((Bool) -> Void)? = nil) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else {
                completion?(false)
                
                return
            }
            URLCache.shared.removeAllCachedResponses()
            DispatchQueue.main.async() { [weak self] in
                completion?(true)
                self?.image = image
            }
        }.resume()
    }
    
}

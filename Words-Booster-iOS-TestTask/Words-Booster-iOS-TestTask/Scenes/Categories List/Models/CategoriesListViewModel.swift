//
//  CategoriesListViewModel.swift
//  Words-Booster-iOS-TestTask
//
//  Created by Dmitriy Dmitriyev on 10.06.2022.
//

import Foundation

class CategoriesListViewModel {
    
    private let jsonFileName = "ios-challenge-words-booster"
    
    func loadJson() -> [Category]? {
        if let url = Bundle.main.url(forResource: jsonFileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode([Category].self, from: data)
                
                return jsonData
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
    
}

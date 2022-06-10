//
//  CategoriesListViewModel.swift
//  Words-Booster-iOS-TestTask
//
//  Created by Dmitriy Dmitriyev on 10.06.2022.
//

import Foundation

class CategoriesListViewModel {
    
    private let jsonFileName = "ios-challenge-words-booster"
    
    private let router = CategoriesListRouter()
    
    func loadJson() -> [Category]? {
        if let url = Bundle.main.url(forResource: jsonFileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let categories = try decoder.decode([Category].self, from: data)
                
                return categories.sorted(by: { $0.order < $1.order })
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
    
    func loadCategoryIfPossible(_ category: Category) {
        router.startFactsFlow(for: category)
    }
    
}

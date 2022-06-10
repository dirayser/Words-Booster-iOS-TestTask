//
//  FactsViewModel.swift
//  Words-Booster-iOS-TestTask
//
//  Created by Dmitriy Dmitriyev on 10.06.2022.
//

import Foundation

class FactsViewModel {
    
    private let router = FactsRouter()
    
    private(set) var facts: [Fact]?
    private var currentIndex = 0
    var currentFact: Fact?
    
    func setupFacts(for category: Category) {
        facts = category.content
        currentFact = facts?.first
    }
    
    func nextFact() -> Fact? {
        guard let facts = facts else { return nil }
        
        if currentIndex < facts.count - 1 {
            currentIndex += 1
            currentFact = facts[currentIndex]
            
            return currentFact
        } else {
            return nil
        }
    }
    
    func previousFact() -> Fact? {
        guard let facts = facts else { return nil }
        
        if currentIndex > 0 {
            currentIndex -= 1
            currentFact = facts[currentIndex]
            
            return currentFact
        } else {
            return nil
        }
    }
    
    func back() {
        router.back()
    }
    
}


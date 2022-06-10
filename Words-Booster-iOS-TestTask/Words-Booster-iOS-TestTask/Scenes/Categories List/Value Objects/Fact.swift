//
//  Fact.swift
//  Words-Booster-iOS-TestTask
//
//  Created by Dmitriy Dmitriyev on 10.06.2022.
//

import Foundation

struct Fact: Decodable {
    
    let fact: String
    let image: URL
    
}

struct Category: Decodable {
    
    let title: String
    let description: String
    let image: URL
    let order: Int
    let status: CategoryStatus
    let content: [Fact]?
    
}

enum CategoryStatus: String, Decodable {
    
    case paid
    case free
    
}

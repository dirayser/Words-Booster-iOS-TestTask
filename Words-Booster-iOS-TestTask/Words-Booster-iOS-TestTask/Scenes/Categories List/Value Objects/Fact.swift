//
//  Fact.swift
//  Words-Booster-iOS-TestTask
//
//  Created by Dmitriy Dmitriyev on 10.06.2022.
//

import Foundation

struct Fact: Decodable {
    
    let fact: String
    let image: String
    
}

struct Category: Decodable {
    
    let title: String
    let description: String
    let image: String
    let order: Int
    let status: String
    let content: [Fact]?
    
}

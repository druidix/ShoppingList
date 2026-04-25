//
//  ShoppingItem.swift
//  ShoppingList
//
//  Created by Kaushik Acharya on 4/24/26.
//

import Foundation

struct ShoppingItem: Identifiable, Codable {
    let id: UUID
    var name: String
    var quantity: String
    var category: String
    var isBought: Bool
    
    init (
        id: UUID = UUID(),
        name: String,
        quantity: String,
        category: String,
        isBought: Bool = false
    ) {
        self.id = id
        self.name = name
        self.quantity = quantity
        self.category = category
        self.isBought = isBought
    }
}

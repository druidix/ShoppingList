//
//  ItemDetailView.swift
//  ShoppingList
//
//  Created by Kaushik Acharya on 5/14/26.
//

import SwiftUI

struct ItemDetailView: View {
    let item: ShoppingItem
    
    var body: some View {
        
        Form {
            Section ("Item") {
                Text(item.name)
            }
            
            Section ("Details") {
                Text("Quantity: \(item.quantity)")
                Text("Category: \(item.category)")
                Text(item.isBought ? "Bought" : "To Buy")
            }
        }
        .navigationTitle("Item Details")
    }
}

#Preview {
    NavigationStack {
        ItemDetailView(item: ShoppingItem(
            name: "Whole Milk",
            quantity: "0.5 gallon",
            category: "Dairy"
        ))
    }
}

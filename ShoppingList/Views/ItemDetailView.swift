//
//  ItemDetailView.swift
//  ShoppingList
//
//  Created by Kaushik Acharya on 5/14/26.
//

import SwiftUI

struct ItemDetailView: View {
    @Binding var item: ShoppingItem
    
    var body: some View {
        
        Form {
            Section ("Item") {
                TextField("Name", text: $item.name)
            }
            
            Section ("Details") {
                TextField("Quantity", text: $item.quantity)
                Text("Category: \(item.category)")
                Toggle("Bought", isOn: $item.isBought)
            }
        }
        .navigationTitle("Item Details")
    }
}

#Preview {
    NavigationStack {
        ItemDetailView(item: .constant(ShoppingItem(
            name: "Whole Milk",
            quantity: "0.5 gallon",
            category: "Dairy"
        )))
    }
}

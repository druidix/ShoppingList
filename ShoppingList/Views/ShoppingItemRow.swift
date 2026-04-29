//
//  ShoppingItemView.swift
//  ShoppingList
//
//  Created by Kaushik Acharya on 4/28/26.
//

import SwiftUI

struct ShoppingItemRow: View {
    let item: ShoppingItem
    
    var body: some View {
        
        HStack {
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                    .strikethrough(item.isBought)
                
                Text("\(item.quantity) • \(item.category)")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
            
            if item.isBought {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundStyle(.green)
            }
        }
    }
}

#Preview {
    ShoppingItemRow(item: ShoppingItem(
        name: "Milk",
        quantity: "1 gallon",
        category: "Dairy"
    ))
}

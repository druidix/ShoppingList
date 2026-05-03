//
//  AddItemView.swift
//  ShoppingList
//
//  Created by Kaushik Acharya on 5/2/26.
//

import SwiftUI

struct AddItemView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var name = ""
    @State private var quantity = ""
    
    // Default to Produce.  Can be updated as needed
    @State private var category = "Produce"
    
    let categories = ["Produce", "Dairy", "Meat", "Pantry", "Snacks", "Bakery", "Frozen"]
    
    var onSave: (ShoppingItem) -> Void
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Item name", text: $name)
                TextField("Quantity", text: $quantity)

                Picker("Category", selection: $category) {
                    ForEach(categories, id: \.self) { category in
                        Text(category)
                    }
                }
            }
            .navigationTitle("Add Item")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }

                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        let trimmedName = name.trimmingCharacters(in: .whitespacesAndNewlines)
                        let trimmedQuantity = quantity.trimmingCharacters(in: .whitespacesAndNewlines)

                        //Prevent creation of empty items
                        guard !trimmedName.isEmpty else { return }

                        let item = ShoppingItem(
                            name: trimmedName,
                            quantity: trimmedQuantity.isEmpty ? "1" : trimmedQuantity,
                            category: category
                        )

                        onSave(item)
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    AddItemView { _ in }
}

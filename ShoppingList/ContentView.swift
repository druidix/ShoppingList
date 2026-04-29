//
//  ContentView.swift
//  ShoppingList
//
//  Created by Kaushik Acharya on 4/1/26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var items: [ShoppingItem] = [
            ShoppingItem(
                name: "Whole Milk",
                quantity: "0.5 gallon",
                category: "Dairy"
            ),
            ShoppingItem(
                name: "Bananas",
                quantity: "4",
                category: "Produce"
            ),
            ShoppingItem(
                name: "Frosted Mini Wheats",
                quantity: "1 box",
                category: "Cereal"
            )
        ]

    var body: some View {
        NavigationStack {
            List(items) { item in
                ShoppingItemRow(item: item)
            }
            .navigationTitle("Shopping List")
        }
    }
}

#Preview {
    ContentView()
}

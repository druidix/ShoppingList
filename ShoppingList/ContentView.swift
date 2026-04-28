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
                VStack(alignment: .leading) {
                    Text(item.name)
                        .font(.headline)
                    //The red dot is just a unicode bullet character
                    //typed in directly.  Nothing fancy :)
                    Text("\(item.quantity) • \(item.category)")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
            .navigationTitle("Shopping List")
            Image(systemName: "cart.fill")
                .font(.system(size: 50))

            Text("Shopping List")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("Grocery Time!")
                .font(.subheadline)

            Button("Add Item") {
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

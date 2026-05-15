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

    @State private var showingAddItem = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(items.indices, id: \.self) { index in
                    NavigationLink{
                        ItemDetailView(item: items[index])
                    } label: {
                        ShoppingItemRow(item: items[index])
                    }
                    .swipeActions(edge: .trailing) {
                        Button(items[index].isBought ? "UN-buy" : "Bought") {
                            items[index].isBought.toggle()
                        }
                        .tint(items[index].isBought ? .orange : .green)
                    }
                }
                .onDelete { indexSet in
                    items.remove(atOffsets: indexSet)
                }
            }
            .navigationTitle("Shopping List")
            .toolbar {
                Button {
                    showingAddItem = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddItem) {
                AddItemView { newItem in
                    items.append(newItem)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

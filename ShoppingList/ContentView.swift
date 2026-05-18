//
//  ContentView.swift
//  ShoppingList
//
//  Created by Kaushik Acharya on 4/1/26.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = ShoppingListViewModel()
    @State private var showingAddItem = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.items) { item in
                    NavigationLink{
                        ItemDetailView(item: viewModel.binding(for: item))
                    } label: {
                        ShoppingItemRow(item: item)
                    }
                    .swipeActions(edge: .trailing) {
                        Button(item.isBought ? "UN-buy" : "Bought") {
                            viewModel.toggleBought(for: item)
                        }
                        .tint(item.isBought ? .orange : .green)
                    }
                }
                .onDelete { indexSet in
                    viewModel.deleteItems(at: indexSet)
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
                    viewModel.addItem(newItem)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

//
//  ShoppingListViewModel.swift
//  ShoppingList
//
//  Created by Kaushik Acharya on 5/17/26.
//

import Foundation
import Combine
import SwiftUI

@MainActor
final class ShoppingListViewModel: ObservableObject {
    @Published var items: [ShoppingItem] = []
    
    init() {
        loadItems()
    }
    
    func addItem(_ item: ShoppingItem) {
        items.append(item)
        saveItems()
    }
    
    func deleteItems(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
        saveItems()
    }
    
    func toggleBought(for item: ShoppingItem) {
        guard let index = items.firstIndex(where: { $0.id == item.id}) else { return }
        items[index].isBought.toggle()
        saveItems()
    }
    
    private func saveItems() {
        do {
            let data = try JSONEncoder().encode(items)
            UserDefaults.standard.set(data, forKey: "shopping_items")
        } catch {
            print("Failed to save items: \(error)")
        }
    }
    
    private func loadItems() {
        guard let data = UserDefaults.standard.data(forKey: "shopping_items") else { return }
        do {
            items = try JSONDecoder().decode([ShoppingItem].self, from: data)
        } catch {
            print("Failed to load items: \(error)")
        }
    }
}

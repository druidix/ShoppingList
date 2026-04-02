//
//  ContentView.swift
//  ShoppingList
//
//  Created by Kaushik Acharya on 4/1/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
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

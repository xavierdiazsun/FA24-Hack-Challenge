//
//  ContentView.swift
//  HackApp
//
//  Created by Zoey Jin on 12/6/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var cartManager = CartManager()
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(itemList, id: \.id) {menuItem in
                        ItemCard(menuItem: menuItem)
                            .environmentObject(cartManager)
                        
                    }
                }
                .padding()
            }
            .navigationTitle("Food Available")
            .toolbar{
                NavigationLink {
                    CartView()
                        .environmentObject(cartManager)

                } label: {
                    cartButton(numItems: cartManager.items.count)
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    ContentView()
}

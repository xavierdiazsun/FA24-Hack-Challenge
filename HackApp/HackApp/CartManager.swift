//
//  CartManager.swift
//  HackApp
//
//  Created by Zoey Jin on 12/6/24.
//

import Foundation

class CartManager: ObservableObject {
    @Published private(set) var items: [MenuItem] = []
    @Published private(set) var total: Int = 0;
    
    func addToCart(menuItem: MenuItem) {
        items.append(menuItem)
        total += menuItem.price
    }
    
    func removeFromCart(menuItem: MenuItem) {
        items = items.filter { $0.id != menuItem.id}
        total -= menuItem.price
    }
    
}

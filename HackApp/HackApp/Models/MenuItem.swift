//
//  MenuItem.swift
//  HackApp
//
//  Created by Zoey Jin on 12/6/24.
//

import SwiftUI

struct MenuItem: Identifiable, Decodable {
    var id = UUID()
    var name: String
    var image: String
    var price: Int
}



//Dummy Data
var itemList = [MenuItem(name: "Pasta: with tomatoes", image: "food1", price: 10),
                   MenuItem(name: "Ice Cream", image: "food2", price: 3),
                   MenuItem(name: "Salad", image: "food3", price: 16),
                   MenuItem(name: "Fruit Salad", image: "food4", price: 7),
                   MenuItem(name: "Pasta", image: "food5", price: 14),
                   MenuItem(name: "Salmon", image: "food6", price: 10),
                   MenuItem(name: "BLT Toast", image: "food7", price: 7),
                   MenuItem(name: "Blueberry Cake", image: "food8", price: 23)]

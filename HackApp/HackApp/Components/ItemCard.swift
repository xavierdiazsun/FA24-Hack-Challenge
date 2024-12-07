//
//  ItemCard.swift
//  HackApp
//
//  Created by Zoey Jin on 12/6/24.
//

import SwiftUICore
import SwiftUI

struct ItemCard: View {
    @EnvironmentObject var cartManager: CartManager
    var menuItem: MenuItem

    var body: some View {
        NavigationLink(destination: DetailView(menuItem: menuItem)) {
            ZStack(alignment: .topTrailing) {
                ZStack(alignment: .bottom) {
                    Image(menuItem.image)
                        .resizable()
                        .cornerRadius(10)
                        .frame(width: 180)
                        .scaledToFit()

                    VStack(alignment: .leading) {
                        Text(menuItem.name)
                            .bold()
                        Text("$\(menuItem.price)")
                            .font(.caption)
                    }
                    .padding()
                    .frame(width: 180, alignment: .leading)
                    .background(.white)
                }
                .frame(width: 190, height: 250)
                .shadow(radius: 3)

                Button {
                    cartManager.addToCart(menuItem: menuItem)
                } label: {
                    Image(systemName: "plus")
                        .padding(10)
                        .foregroundColor(.black)
                        .background(.white)
                        .cornerRadius(50)
                        .padding(10)
                }
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}

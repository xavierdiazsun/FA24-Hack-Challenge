//
//  ItemRow.swift
//  HackApp
//
//  Created by Zoey Jin on 12/6/24.
//

import SwiftUI

struct ItemRow: View {
    @EnvironmentObject var cartManager: CartManager
    var menuItem: MenuItem
    
    var body: some View {
        HStack(spacing: 20){
            Image(menuItem.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50)
                .cornerRadius(10)
            
            VStack(alignment: .leading, spacing: 10){
                Text(menuItem.name)
                    .bold()
                Text("$\(menuItem.price)")
            }
            
            Spacer()
            
            Image(systemName: "trash")
                .foregroundColor(.red)
                .onTapGesture {
                    cartManager.removeFromCart(menuItem: menuItem)
                }
            
            
            
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    ItemRow(menuItem: itemList[3] )
}

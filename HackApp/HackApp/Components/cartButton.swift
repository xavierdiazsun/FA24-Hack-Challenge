//
//  cartButton.swift
//  HackApp
//
//  Created by Zoey Jin on 12/6/24.
//

import SwiftUI

struct cartButton: View {
    var numItems: Int
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Image(systemName: "cart")
                .padding(.top, 5)
            if (numItems > 0) {
                Text("\(numItems)")
                    .font(.caption2).bold()
                    .foregroundColor(.white)
                    .frame(width: 15,  height: 15)
                    .background(.blue)
                    .cornerRadius(50)
            }
        }
    }
}

#Preview {
    cartButton(numItems: 1)
}

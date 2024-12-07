//
//  DetailView.swift
//  HackApp
//
//  Created by Dicky Ning on 12/6/24.
//

import SwiftUI

struct DetailView: View {
    var menuItem: MenuItem

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Image(menuItem.image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 250)
                    .cornerRadius(10)

                Text(menuItem.name)
                    .font(.largeTitle)
                    .bold()

                Text("$\(menuItem.price)")
                    .font(.title)
                    .foregroundColor(.gray)

                Text("This is a delicious \(menuItem.name) that will satisfy your hunger. Don't miss out on the chance to try it!")
                    .font(.body)
                    .padding(.top)

                Spacer()
            }
            .padding()
        }
        .navigationTitle(menuItem.name)
    }
}

#Preview {
    DetailView(menuItem: itemList[0])
}

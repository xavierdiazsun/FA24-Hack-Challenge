//
//  NetworkManager.swift
//  HackApp
//
//  Created by Dicky Ning on 12/6/24.
//

import Foundation
import Alamofire

class MenuManager: ObservableObject {
    @Published var menuItems: [MenuItem] = []

    func fetchMenuItems() {
        guard let url = URL(string: "PlaceHolder backend api menuitem") else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error fetching data: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                let items = try JSONDecoder().decode([MenuItem].self, from: data)
                DispatchQueue.main.async {
                    self.menuItems = items
                }
            } catch {
                print("Error decoding data: \(error.localizedDescription)")
            }
        }.resume()
    }
}

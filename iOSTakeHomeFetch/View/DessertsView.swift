//
//  ContentView.swift
//  iOSTakeHomeFetch
//
//  Created by Steven Chung on 6/28/24.
//

import SwiftUI

struct DessertsView: View {
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        
        NavigationView(content:  {
            List(networkManager.desserts) { dessert in
                NavigationLink(destination: DetailView(mealId: dessert.id)) {
                    Text(dessert.strMeal)
                }
            }
            .task {
                do {
                    try await networkManager.getDesserts()
                } catch DessertError.invalidURL {
                    print("invalid URL")
                } catch DessertError.invalidData {
                    print("invalid Data")
                } catch DessertError.invalidResponse {
                    print("invalid Response")
                } catch {
                    print("unexpected Error")
                }
            }
            .navigationTitle("Desserts")
        })
    }
}

#Preview {
    DessertsView()
}

//
//  ContentView.swift
//  iOSTakeHomeFetch
//
//  Created by Steven Chung on 6/28/24.
//

import SwiftUI

struct DetailView: View {
    
    let mealId: String
    @ObservedObject var networkManager = NetworkManager()
    private let ingredientColumns = [
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
    
    var body: some View {
        VStack {
            Text("\(networkManager.dessertName)")
            Text("Ingredients: Measurement")
            
            Text("Instructions: \(networkManager.dessertInstructions)")
            Text("Measurements:")
            LazyVGrid(columns: ingredientColumns, alignment: .leading, spacing: 4) {
                ForEach(networkManager.measurements, id: \.self) { value in
                    Text(value?.ingredient ?? "")
                    Text(value?.measurement ?? "")
                }
            }
        }
        .task {
            do {
                try await networkManager.getDessertDetail(mealId: self.mealId)
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
        .padding()
    }
}

#Preview {
    DetailView(mealId: "")
}

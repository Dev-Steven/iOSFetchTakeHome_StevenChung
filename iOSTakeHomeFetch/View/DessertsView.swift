//
//  ContentView.swift
//  iOSTakeHomeFetch
//
//  Created by Steven Chung on 6/28/24.
//

import SwiftUI

struct DessertsView: View {
    // TODO: Deepdive into ObservedObject
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        Text("Desserts")
        List(networkManager.desserts) { dessert in
            // TODO: Create a clickable view for more details about the dessert selected
            Text(dessert.strMeal)
        }
        .task { // TODO: .task vs .onAppear
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
    }
}

#Preview {
    DessertsView()
}

//
//  NetworkManager.swift
//  iOSTakeHomeFetch
//
//  Created by Steven Chung on 6/30/24.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var desserts = [Meal]()
    
    func getDesserts() async throws {
        let endpoint = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
        
        // Create a URL object from the endpoint
        guard let url = URL(string: endpoint) else {
            throw DessertError.invalidURL
        }
        
        // Get the data from the url (GET request)
        let (data, response) = try await URLSession.shared.data(from: url)
        
        // Checking to make sure we have a 200 which means we've successfully got the data
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw DessertError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            // Use decoder to decode data into a DessertList Object
            let results = try decoder.decode(DessertList.self, from: data)
            DispatchQueue.main.async { // TODO: understand "DispatchQueue.main.async"
                self.desserts = results.meals.sorted(by: {$0.strMeal < $1.strMeal})
            }
            
        } catch {
            throw DessertError.invalidData
        }
    }
    
}

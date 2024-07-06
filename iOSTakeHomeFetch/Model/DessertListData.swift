//
//  DessertModel.swift
//  iOSTakeHomeFetch
//
//  Created by Steven Chung on 6/30/24.
//

import Foundation

struct DessertListData: Decodable {
    let meals: [Meal]
}

struct Meal: Decodable, Identifiable {
    var id: String {
        return idMeal
    }
    let idMeal: String
    let strMeal: String
    let strMealThumb: String
}

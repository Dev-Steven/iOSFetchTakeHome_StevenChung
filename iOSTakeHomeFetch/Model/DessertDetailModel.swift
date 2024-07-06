//
//  DessertDetailModel.swift
//  iOSTakeHomeFetch
//
//  Created by Steven Chung on 7/2/24.
//

import Foundation

struct DessertDetailModel {
    let dessertName: String
    let instructions: String
    let ingredients: [Ingredient]
}

struct Ingredient: Hashable {
    let measurement: String
    let ingredient: String
}

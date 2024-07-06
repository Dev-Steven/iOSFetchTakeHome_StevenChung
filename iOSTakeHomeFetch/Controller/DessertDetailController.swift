//
//  DessertDetailController.swift
//  iOSTakeHomeFetch
//
//  Created by Steven Chung on 7/6/24.
//

import Foundation

class DessertDetailController {
    
    // this function will get the measurements that aren't empty strings
    func getMeasurements(dessert: MealDetail) -> [Ingredient?] {
        
        var measurements = [Ingredient?]()
        
        measurements.append(combine(ingredient: dessert.strIngredient1, measurement: dessert.strMeasure1))
        measurements.append(combine(ingredient: dessert.strIngredient2, measurement: dessert.strMeasure2))
        measurements.append(combine(ingredient: dessert.strIngredient3, measurement: dessert.strMeasure3))
        measurements.append(combine(ingredient: dessert.strIngredient4, measurement: dessert.strMeasure4))
        measurements.append(combine(ingredient: dessert.strIngredient5, measurement: dessert.strMeasure5))
        measurements.append(combine(ingredient: dessert.strIngredient6, measurement: dessert.strMeasure6))
        measurements.append(combine(ingredient: dessert.strIngredient7, measurement: dessert.strMeasure7))
        measurements.append(combine(ingredient: dessert.strIngredient8, measurement: dessert.strMeasure8))
        measurements.append(combine(ingredient: dessert.strIngredient9, measurement: dessert.strMeasure9))
        measurements.append(combine(ingredient: dessert.strIngredient10, measurement: dessert.strMeasure10))
        measurements.append(combine(ingredient: dessert.strIngredient11, measurement: dessert.strMeasure11))
        measurements.append(combine(ingredient: dessert.strIngredient12, measurement: dessert.strMeasure12))
        measurements.append(combine(ingredient: dessert.strIngredient13, measurement: dessert.strMeasure13))
        measurements.append(combine(ingredient: dessert.strIngredient14, measurement: dessert.strMeasure14))
        measurements.append(combine(ingredient: dessert.strIngredient15, measurement: dessert.strMeasure15))
        measurements.append(combine(ingredient: dessert.strIngredient16, measurement: dessert.strMeasure16))
        measurements.append(combine(ingredient: dessert.strIngredient17, measurement: dessert.strMeasure17))
        measurements.append(combine(ingredient: dessert.strIngredient18, measurement: dessert.strMeasure18))
        measurements.append(combine(ingredient: dessert.strIngredient19, measurement: dessert.strMeasure19))
        measurements.append(combine(ingredient: dessert.strIngredient20, measurement: dessert.strMeasure20))
        
        return measurements
    }
            
    func combine(ingredient: String?, measurement: String?) -> Ingredient? {
        guard let ingredient, let measurement, 
                !ingredient.isEmpty, !measurement.isEmpty else {
            return nil
        }
        
        return Ingredient(measurement: measurement, ingredient: ingredient)
    }
    
}

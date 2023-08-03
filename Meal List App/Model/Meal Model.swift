//
//  Meal Model.swift
//  Meal List App
//
//  Created by William Yulio on 01/08/23.
//

import Foundation

// MARK: - Meal
struct Meal: Codable {
    let meals: [MealElement]
}

// MARK: - MealElement
struct MealElement: Codable {
    let strMeal: String
    let strMealThumb: String
    let idMeal: String
}

//struct DetailMeal: Codable {
//    let meals: [[String: String?]]
//}

struct DetailMeal: Codable {
    
    let idMeal: String
    let strMeal: String
    let strCategory: String
    let strArea: String
    let strInstructions: String
    let strMealThumb: String
    let strYoutube: String
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?
    let strIngredient7: String?
    let strIngredient8: String?
    let strIngredient9: String?
    let strMeasure1: String?
    let strMeasure2: String?
    let strMeasure3: String?
    let strMeasure4: String?
    let strMeasure5: String?
    let strMeasure6: String?
    let strMeasure7: String?
    let strMeasure8: String?
    let strMeasure9: String?
    
    var ingredients: [String] {
            return [strIngredient1, strIngredient2, strIngredient3, strIngredient4, strIngredient5, strIngredient6, strIngredient7, strIngredient8, strIngredient9].compactMap { $0 }
        }

    var measures: [String] {
        return [strMeasure1, strMeasure2, strMeasure3, strMeasure4, strMeasure5, strMeasure6, strMeasure7, strMeasure8, strMeasure9].compactMap { $0 }
    }
    
//    var ingredients: [String] {
//            var ingredientList: [String] = []
//            for index in 1...9 {
//                if let ingredient = self["strIngredient\(index)"], !ingredient.isEmpty {
//                    ingredientList.append(ingredient)
//                }
//            }
//            return ingredientList
//        }
//
//        var measures: [String] {
//            var measureList: [String] = []
//            for index in 1...9 {
//                if let measure = self["strMeasure\(index)"], !measure.isEmpty {
//                    measureList.append(measure)
//                }
//            }
//            return measureList
//        }
//
//        private subscript(key: String) -> String? {
//            return self[keyPath: \DetailMeal[key]]
//        }
}

struct MealsResponse: Codable {
    let meals: [DetailMeal]
}

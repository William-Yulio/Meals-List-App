//
//  MealVM.swift
//  Meal List App
//
//  Created by William Yulio on 01/08/23.
//

import SwiftUI
import Combine

class MealVM: ObservableObject {
    @Published var fetchedMealData: [MealElement] = []
    @Published var fetchedDetailData: DetailMeal?
    private var cancellables = Set<AnyCancellable>()
    
    func fetchMealData() {
        
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/filter.php?c=Seafood") else { return }
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField:"Content-Type")

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest) { data, response, error in

            guard let data = data, error == nil else {
                print("Error when try to get the data")
                return
            }


            do {
                let result = try JSONDecoder().decode(Meal.self, from: data)
                DispatchQueue.main.async {
                    if let response = response as? HTTPURLResponse{
                        if response.statusCode == 200 {
                            self.fetchedMealData = result.meals
                        }
                    }
                }
            } catch {
                print("ERROR \(error)")
            }
        }

        dataTask.resume()
    }
    
    func fetchMealDetail() {
        
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/lookup.php?i=52772") else { return }
        var request = URLRequest(url: url)

        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField:"Content-Type")

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest) { data, response, error in

            guard let data = data, error == nil else {
                print("Error when try to get the data")
                return
            }


            do {
                let result = try JSONDecoder().decode(MealsResponse.self, from: data)
                DispatchQueue.main.async {
                    if let response = response as? HTTPURLResponse{
                        if response.statusCode == 200 {
                            self.fetchedDetailData = result.meals.first
                        }
                    }
                }
            } catch {
                print("ERROR \(error)")
            }
        }

        dataTask.resume()
    }
    
}

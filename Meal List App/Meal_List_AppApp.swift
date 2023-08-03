//
//  Meal_List_AppApp.swift
//  Meal List App
//
//  Created by William Yulio on 01/08/23.
//

import SwiftUI

@main
struct Meal_List_AppApp: App {
    @StateObject var mealVM = MealVM()
    var body: some Scene {
        WindowGroup {
            MealListView().environmentObject(mealVM)
        }
    }
}

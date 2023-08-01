//
//  ContentView.swift
//  Meal List App
//
//  Created by William Yulio on 01/08/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var mealVM =  MealVM()
    var body: some View {
        NavigationView{
            VStack {
                List(){
                    Text("Range user age between 0 - 10 = \(VM.a) users")
                    Text("Range user age between 11 - 20 = \(VM.b) users")
                    Text("Range user age between 21 - 30 = \(VM.c) users")
                    Text("Range user age between 31 - \(VM.maxAge) = \(VM.d) users")
                }
                
                
            }
            .onAppear(){
                mealVM.fetchMealData()
                //            VM.calculateAge()
            }
            .navigationTitle("Meal's List")
        }
    }
}

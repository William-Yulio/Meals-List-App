//
//  ContentView.swift
//  Meal List App
//
//  Created by William Yulio on 01/08/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct MealListView: View {
    @StateObject var mealVM =  MealVM()
    var body: some View {
        NavigationView{
            List(){
                ForEach(mealVM.fetchedMealData, id: \.idMeal){ data in
                    if !data.strMeal.isEmpty && !data.strMealThumb.isEmpty{
                        NavigationLink(destination: MealDetailView(mealVM: mealVM)
                            .navigationTitle("Detail Meal")
                            .navigationBarTitleDisplayMode(.large)){
                                HStack(spacing: 10){
                                    WebImage(url: URL(string: data.strMealThumb))
                                        .resizable() // Resizable like SwiftUI.Image
                                        .scaledToFit()
                                        .frame(width: 100, height: 100)
                                    
                                    Text(data.strMeal)
                                        .font(.title3)
                                        .fontWeight(.semibold)
                                }
                            }
                    }else{
                        Text("There is no data")
                    }
                }
            }
            .onAppear(){
                mealVM.fetchMealData()
            }
            .navigationTitle("Meal's List")
        }
    }
}

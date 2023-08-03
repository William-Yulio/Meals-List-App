//
//  MealDetailView.swift
//  Meal List App
//
//  Created by William Yulio on 01/08/23.
//

import SwiftUI
import SDWebImageSwiftUI
struct MealDetailView: View {
    @ObservedObject var mealVM: MealVM
//    @State var detailData: [[String: String?]]
    var body: some View {
        VStack(){
            if let meal = mealVM.fetchedDetailData{
                ScrollView{
                    WebImage(url: URL(string: meal.strMealThumb))
                        .resizable()
                        .frame(width: K.widthDf, height: K.heightDf * 0.3)
                    
                    VStack(spacing: 10){
                        
                        Text(meal.strMeal)
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        HStack(spacing: 10){
                            Text(meal.strArea)
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding(7)
                                .background(Color(hex: "8C3333"))
                                .cornerRadius(25)
                            
                            Text(meal.strCategory)
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding(7)
                                .background(Color(hex: "8C3333"))
                                .cornerRadius(25)
                        }
                        
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack(spacing: 5){
                                ForEach(meal.ingredients.indices, id: \.self) { index in
                                    ZStack{
                                        Circle()
                                            .fill(Color(hex: "F2EE9D"))
                                            .frame(width: 150, height: 120)
                                        VStack(alignment: .center, spacing: 10){
                                            
                                            Text(meal.ingredients[index])
                                                .font(.headline)
                                                .fontWeight(.semibold)
                                                .frame(width: 100)
                                                .lineLimit(2)
                                                .multilineTextAlignment(.center)
                                            Text(meal.measures[index])
                                                .font(.subheadline)
                                                .frame(width: 100)
                                                .lineLimit(2)
                                                .multilineTextAlignment(.center)
                                        }
                                    }
                                }
                            }
                        }.frame(width: K.widthDf, height: K.heightDf * 0.15)
                        
                        Text("Instruction")
                            .font(.title2)
                            .fontWeight(.medium)
                        
                        Text(meal.strInstructions)
                            .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
                            .multilineTextAlignment(.leading)
                            .lineSpacing(5)
                        
                    }
                }
            }else{
                Text("Loading")
            }
            
        }
        .onAppear(){
            mealVM.fetchMealDetail()
        }
    }
}


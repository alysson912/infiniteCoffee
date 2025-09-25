//
//  CoffeModel.swift
//  InfiniteCoffee
//
//  Created by ALYSSON MENEZES on 24/09/25.
//

import Foundation

struct CoffeModel: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    var imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
    let stars: Int
    let mostWanted: Bool
}


struct CoffeResponse: Decodable {
    let request: [CoffeModel]
}


struct MockData {
    
    static let sampleAppetizer = CoffeModel(id: 0001,
                                           name: "Test Appetizer",
                                           description: "This is the description for my appetizer. It's yummy.",
                                           price: 9.99,
                                           imageURL: "Constants.randomImage",
                                           calories: 99,
                                           protein: 99,
                                            carbs: 99,
                                            stars: 2,
                                            mostWanted: true)
    
    static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]
    
    static let orderItemOne  = CoffeModel(id: 0001,
                                           name: "Test Appetizer One",
                                           description: "This is the description for my appetizer. It's yummy.",
                                           price: 9.99,
                                           imageURL: "Constants.randomImage",
                                           calories: 99,
                                           protein: 99,
                                          carbs: 99,
                                          stars: 1,
                                          mostWanted: false)
    
    static let orderItemTwo  = CoffeModel(id: 0002,
                                           name: "Test Appetizer Two",
                                           description: "This is the description for my appetizer. It's yummy.",
                                           price: 9.99,
                                            imageURL: "Constants.randomImage",
                                           calories: 99,
                                           protein: 99,
                                          carbs: 99,
                                          stars: 5,
                                          mostWanted: false)
    
    static let orderItemThree  = CoffeModel(id: 0003,
                                           name: "Test Appetizer Three",
                                           description: "This is the description for my appetizer. It's yummy.",
                                           price: 9.99,
                                           imageURL: "Constants.randomImage",
                                           calories: 99,
                                           protein: 99,
                                            carbs: 99,
                                            stars: 4,
                                            mostWanted: false)
    
    static let orderItems = [orderItemOne, orderItemTwo, orderItemThree]
}

//
//  CoffeModel.swift
//  InfiniteCoffee
//
//  Created by ALYSSON MENEZES on 24/09/25.
//



import Foundation

// MARK: - Empty
struct Empty: Codable {
    let products: [Product]?
    let total, skip, limit: String?
}

// MARK: - Product
struct Coffe: Codable {
    let id, title, description: String?
    let price: Double
    let discountPercentage, rating, stock, brand: String?
    let category: String?
    let thumbnail: String?
    let images: [String]?
}



struct MockData {
    
    static let sampleAppetizer = Coffe(
        id: "sdsadfkmqewq",
        title: "Cafe coado",
        description: "Expresso com leite microespumado, textura aveludada",
        price: 15.50,
        discountPercentage: "7",
        rating: "4.6",
        stock: "18",
        brand: "Café Sydney",
        category: "Flat White",
        thumbnail: "https://coffee.alexflipnote.dev/random",
        images: ["https://coffee.alexflipnote.dev/random"]
    )
    
    static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]
    
}

//
//  ProductsModel.swift
//  InfiniteCoffee
//
//  Created by Alysson Menezes Dodo on 17/10/25.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let dataProducts = try? JSONDecoder().decode(DataProducts.self, from: jsonData)

struct CoffeData: Codable {
    let productList: [CoffeModel]?
    
}

// MARK: - Product
struct CoffeModel: Codable, Identifiable {
    let id: String
    let title, description: String?
    let price, rating, discountPercentage: Double?
    let brand: String?
    let stock: Int?
    let category: String?
    let thumbnail: String?
    let images: [String]?
}



struct MockData {
    
    static let sampleAppetizer = CoffeModel(
        id: "sdsadfkmqewq",
        title: "Cafe coado",
        description: "Expresso com leite microespumado, textura aveludada",
        price: 15.50,
        rating: 4.6,
        discountPercentage: 7,
        brand: "Café Sydney",
        stock: 18,
        category: "Flat White",
        thumbnail: "https://coffee.alexflipnote.dev/random",
        images: ["https://coffee.alexflipnote.dev/random"]
    )
    
    static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]
    
}

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
    let productList: [CoffeModel]
    
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
    let images: String
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
        images: "https://coffee.alexflipnote.dev/random"
    )
    
    static let sampleAppetizer2 = CoffeModel(
        id: "b12x9qwe88",
        title: "Cappuccino Cremoso",
        description: "Café espresso com leite vaporizado e espuma densa por cima.",
        price: 18.90,
        rating: 4.8,
        discountPercentage: 5,
        brand: "Café Florença",
        stock: 25,
        category: "Cappuccino",
        thumbnail: "https://coffee.alexflipnote.dev/random",
        images: "https://coffee.alexflipnote.dev/random"
    )

    
    static let sampleAppetizer3 = CoffeModel(
        id: "qwe7812md98",
        title: "Mocha Chocolate",
        description: "Combinação equilibrada de chocolate, café espresso e leite vaporizado.",
        price: 22.50,
        rating: 4.5,
        discountPercentage: 10,
        brand: "Doce Grão",
        stock: 12,
        category: "Mocha",
        thumbnail: "https://coffee.alexflipnote.dev/random",
        images: "https://coffee.alexflipnote.dev/random"
    )

    
    static let sampleAppetizer4 = CoffeModel(
        id: "9981asdkl23",
        title: "Latte Baunilha",
        description: "Espresso suave misturado com leite vaporizado e toque de baunilha.",
        price: 19.00,
        rating: 4.7,
        discountPercentage: 8,
        brand: "Grão do Norte",
        stock: 30,
        category: "Latte",
        thumbnail: "https://coffee.alexflipnote.dev/random",
        images: "https://coffee.alexflipnote.dev/random"
    )
    static let appetizers = [sampleAppetizer, sampleAppetizer2, sampleAppetizer3, sampleAppetizer4]
    
}

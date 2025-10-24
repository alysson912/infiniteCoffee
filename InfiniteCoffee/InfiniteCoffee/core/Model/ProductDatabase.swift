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

import Foundation

struct ProductArray: Codable {
    let products: [Product]
    let total, skip, limit: Int
}

struct Product: Identifiable, Codable {
    let id: Int
    let title: String?
    let description: String?
    let price: Double?
    let discountPercentage: Double?
    let rating: Double?
    let stock: Int?
    let brand, category: String?
    let thumbnail: String?
    let images: [String]?


enum CodingKeys: String, CodingKey {
       case id
       case title
       case description
       case price
       case discountPercentage
       case rating
       case stock
       case brand
       case category
       case thumbnail
       case images
   }
   
   static func ==(lhs: Product, rhs: Product) -> Bool {
       return lhs.id == rhs.id
   }
   
}



//    func downloadProductsAndUploadToFirebase() {
//        guard let url = URL(string: "https://dummyjson.com/products") else { return }
//
//        Task {
//            do {
//                let (data, _) = try await URLSession.shared.data(from: url)
//                let products = try JSONDecoder().decode(ProductArray.self, from: data)
//                let productArray = products.products
//
//                for product in productArray {
//                    try? await ProductsManager.shared.uploadProduct(product: product)
//                }
//
//                print("SUCCESS")
//                print(products.products.count)
//            } catch {
//                print(error)
//            }
//        }
//    }


struct ProductDatabase {
    
    // MARK: - 25 Novos Itens (Simulando Cafeteria)
    
    static let sampleProduct: Product =
        // BEBIDAS QUENTES
        Product(
            id: 13,
            title: "Espresso Simples",
            description: "Dose única de café expresso puro e intenso.",
            price: 7.00,
            discountPercentage: 0.0,
            rating: 4.5,
            stock: 100,
            brand: "Cafeteria Central",
            category: "Bebidas Quentes",
            thumbnail: "espresso_thumb",
            images: ["espresso_img1"]
        )
    
    static let product = [sampleProduct, sampleProduct, sampleProduct, sampleProduct]
    
    static let orderItemOne = Product(
            id: 14,
            title: "Latte Macchiato",
            description: "Três camadas: leite, espresso e espuma, servido em copo alto.",
            price: 16.50,
            discountPercentage: 5.0,
            rating: 4.7,
            stock: 45,
            brand: "Cafeteria Central",
            category: "Bebidas Quentes",
            thumbnail: "latte_thumb",
            images: ["latte_img1"]
        )
    static let orderItemTwo = Product(
            id: 15,
            title: "Mocha de Chocolate",
            description: "Café, chocolate, leite vaporizado e chantilly no topo.",
            price: 19.90,
            discountPercentage: 0.0,
            rating: 4.6,
            stock: 30,
            brand: "Cafeteria Central",
            category: "Bebidas Quentes",
            thumbnail: "mocha_thumb",
            images: ["mocha_img1"]
        )
    static let orderItemThree = Product(
            id: 16,
            title: "Chá de Hibisco",
            description: "Infusão natural de hibisco e frutas vermelhas, sem cafeína.",
            price: 12.00,
            discountPercentage: 0.0,
            rating: 4.2,
            stock: 60,
            brand: "Chás & Ervas",
            category: "Chás",
            thumbnail: "hibisco_thumb",
            images: ["hibisco_img1"]
        )
    static let orderFour = Product(
            id: 17,
            title: "Chocolate Quente Cremoso",
            description: "Receita especial com cacau 50%, espessa e aveludada.",
            price: 17.50,
            discountPercentage: 10.0,
            rating: 4.9,
            stock: 35,
            brand: "Cafeteria Central",
            category: "Bebidas Quentes",
            thumbnail: "choc_quente_thumb",
            images: ["choc_quente_img1"]
        )
        
        
    static let orderItems = [orderItemOne, orderItemTwo, orderItemThree, orderFour]
    
}

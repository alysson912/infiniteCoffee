//
//  ProductsManager.swift
//  InfiniteCoffee
//
//  Created by Alysson Menezes Dodo on 17/10/25.
//

import Foundation
import FirebaseFirestore

    enum Error: Swift.Error {
        case fileNoFound(name: String)
        case fileDecodingFailed(name: String, Swift.Error)
       // case erroRequest(AFError) //  Retorno do Alamofire (de erro)
    }

final class ProductsManager {
    
    static let shared = ProductsManager()
    private init() {}
    
    private let productsCollection = Firestore.firestore().collection("products")
    
    private let encoder: Firestore.Encoder = {
        let encoder = Firestore.Encoder()
        return encoder
    }()
    private let dencoder: Firestore.Decoder = {
        let dencoder = Firestore.Decoder()
        return dencoder
    }()
    

    
    private func productDocument(productId: String) -> DocumentReference {
        productsCollection.document(productId)
    }
    //MARK: push to firebase
    func uploadProduct(product: CoffeModel)  {
        try? productDocument(productId: (product.id)).setData(from: product, merge: false)
    }
    
    func getProduct(productId: String) async throws -> CoffeModel {
        try await productDocument(productId: productId).getDocument(as: CoffeModel.self)
    }
    
    func getAllProducts() async throws -> [CoffeModel]{
        try await productsCollection.getDocument2(as: CoffeModel.self)
    }
}

extension Query {
    //passando qualquer tipo para a func
    // Func com tipo generico T onde o tipo esteja em conformidade com o protocolo Decodable
    func getDocument2<T>(as type: T.Type) async throws -> [T] where T : Decodable {
        let snapshot = try await self.getDocuments()
        
        return try snapshot.documents.map({ document in
            try document.data(as: T.self)
            
        })
    }
}

// MARK: FUNC PARA ENVIAR TODO O JSON MOCKADO PARA O DB
//extension ProductsManager {
//    func getHomeFromJson(){
//        guard let url = Bundle.main.url(forResource: "CoffeData", withExtension: "json") else { return }
//
//        do {
//            let data = try Data(contentsOf: url)
//            let coffeData = try JSONDecoder().decode(CoffeData.self, from: data)
//            let listProducts = coffeData.productList
//// upload to firebase
//            for product in listProducts {
//                 ProductsManager.shared.uploadProduct(product: product)
//            }
//            
//        } catch {
//           print(error)
//        }
//    }
//}
//

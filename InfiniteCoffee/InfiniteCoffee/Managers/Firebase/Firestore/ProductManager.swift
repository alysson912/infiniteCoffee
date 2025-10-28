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

enum TypeFetch {
    case mock
    case request
}


protocol GenericService: AnyObject {
    typealias completion <T> = (_ result: T, _ failure: Error?) -> Void
}

protocol ProductsViewModelelegate: GenericService {
    func getHomeFromJson(completion: @escaping completion<CoffeData?>)
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
    
    func uploadProduct(product: CoffeModel) async throws {
        try productDocument(productId: (product.id)).setData(from: product, merge: false)
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

extension ProductsManager: ProductsViewModelelegate {
    //MARK: MOCK DATA.JSON
    func getHomeFromJson(completion: @escaping completion<CoffeData?>) {
        if let url = Bundle.main.url(forResource: "CoffeData", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let coffeData: CoffeData = try JSONDecoder().decode(CoffeData.self, from: data)
                completion(coffeData, nil)
                print(coffeData)
            } catch {
                completion(nil, Error.fileDecodingFailed(name: "CoffeData", error))
            }
        } else {
            completion(nil, Error.fileNoFound(name: "CoffeData"))
        }
    }
}

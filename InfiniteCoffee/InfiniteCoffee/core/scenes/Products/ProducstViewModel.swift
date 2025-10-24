//
//  ViewModel.swift
//  InfiniteCoffee
//
//  Created by Alysson Menezes Dodo on 17/10/25.
//

import Foundation
import Combine



@MainActor
final class ProductsViewModel: ObservableObject {
    
    @Published private(set) var products: [Product] = []
    
    func downloadProductsAndUpdateToFirebase() {
        guard let url = URL(string: Constants.productsURL) else { return }
        
        Task {
            do {
                let (data, response) = try await URLSession.shared.data(from: url)
                let products = try JSONDecoder().decode(ProductArray.self, from: data)
                
                print("SUCCESS")
                print(products.products)
            } catch {
                print(error)
            }
        }
    }
}

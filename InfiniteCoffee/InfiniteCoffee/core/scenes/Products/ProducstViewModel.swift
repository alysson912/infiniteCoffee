//
//  ViewModel.swift
//  InfiniteCoffee
//
//  Created by Alysson Menezes Dodo on 17/10/25.

/* MARK: private(set)
 Significa que apenas o próprio tipo (classe/struct) pode modificar essa propriedade.
 Mas outros objetos podem ler o valor normalmente.
 
 Exemplo:
 O ViewModel pode alterar products.
 As Views (ou outros objetos) só podem ler, não podem atribuir um novo valor.
 
 */

import Foundation
import Combine

@MainActor
final class ProductsViewModel: ObservableObject {
    @Published private(set) var products: [CoffeModel] = []
    
    
    public func getAllProducts() async throws {
        self.products = try await ProductsManager.shared.getAllProducts()
    }
}




extension ProductsViewModel {
    static var mock: ProductsViewModel {
        let vm = ProductsViewModel()
        vm.products = MockData.appetizers   // <<< seus dados mockados
        return vm
    }
}

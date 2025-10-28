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
     var productData: CoffeData?
    
    
    public func fetchRequest(_ typeFetch: TypeFetch) {
        switch typeFetch {
            
        case .mock:
            ProductsManager.shared.getHomeFromJson { result, failure in
                self.productData = result
            }
        case .request:
            print("request")
        }
    }
    
    
    
}

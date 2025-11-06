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
    
    
    public func fetchRequest()  {
        ProductsManager.shared.getHomeFromJson()
        }
    }
    
    
    


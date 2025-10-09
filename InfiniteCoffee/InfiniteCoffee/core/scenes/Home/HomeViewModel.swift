//
//  HomeViewModel.swift
//  InfiniteCoffee
//
//  Created by ALYSSON MENEZES on 24/09/25.
//

import Foundation
import Combine

 class HomeViewModel: ObservableObject {
    
    @Published var data: [CoffeModel] = []
    
   
     public func fetchRequest() {
         
     }
}

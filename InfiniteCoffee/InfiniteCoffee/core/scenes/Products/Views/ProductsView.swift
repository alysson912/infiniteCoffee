//
//  ProductsView.swift
//  InfiniteCoffee
//
//  Created by Alysson Menezes Dodo on 17/10/25.
//

import SwiftUI
import Combine

struct ProductsView: View {
    @State var productData: CoffeModel?
    
    @StateObject private var viewModel = ProductsViewModel()
    
    var body: some View {
        
        ZStack() {
            VStack () {
                List {
                    ForEach(viewModel.products) { product in
                        
                        MainCardCell(coffe: product)
                          
                        
                    }
                }
                .shadow(radius: 10)
                .navigationTitle("Products")
                .task {
                    try? await viewModel.getAllProducts()
                }
            }
            
        }
    }
}



#Preview {
    NavigationStack {
        ProductsView()
    }
}

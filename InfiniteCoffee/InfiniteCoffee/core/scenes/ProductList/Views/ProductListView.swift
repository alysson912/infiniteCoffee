//
//  ProductsView.swift
//  InfiniteCoffee
//
//  Created by Alysson Menezes Dodo on 17/10/25.
//

import SwiftUI
import Combine

struct ProductListView: View {
    @EnvironmentObject var viewModel: ProductListViewModel
    
       
    private let colunas = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
        
    var body: some View {
            VStack {
                ScrollView {
                    LazyVGrid(columns: colunas, spacing: 4) {
                        ForEach(viewModel.products) { product in
                            MainCardCell(coffe: product)
                            
                        }
                    }
                }
                .padding(.horizontal, 6)
                .shadow(radius: 10)
              //  .navigationTitle("Products")
                .task {
                    try? await viewModel.getAllProducts()
                }
            }
           
        }
    }




#Preview {
    NavigationStack {
            ProductListView()
                .environmentObject(ProductListViewModel.mock)
        }
    }
    


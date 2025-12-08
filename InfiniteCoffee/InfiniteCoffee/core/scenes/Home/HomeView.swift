//
//  HomeView.swift
//  InfiniteCoffee
//
//  Created by ALYSSON MENEZES on 24/09/25.
//

import SwiftUI
import Combine

struct HomeView: View {
    
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        ZStack {
            
            Color.customGreen.ignoresSafeArea()
            
           
               
                
                    .navigationTitle("🍟 HomeView")
            
        }
        
        
        
        
    }
    private var listView: some View {
        List {
//            ForEach(viewModel.data) { item in
//                MainCardCell(appetizer: item)
//                
//            }
        }
    }

}

#Preview {
    HomeView()
}

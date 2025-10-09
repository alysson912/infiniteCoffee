//
//  HomeView.swift
//  InfiniteCoffee
//
//  Created by ALYSSON MENEZES on 24/09/25.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        ZStack {
            
            Color.red.ignoresSafeArea()
            
            NavigationStack {
               
                listView
                    .frame(width: .infinity, height: 450)
                    .navigationTitle("🍟 HomeView")
            }
        }
        
        
        
        
    }
    private var listView: some View {
        List {
            ForEach(viewModel.data) { item in
                MainCardCell(appetizer: item)
                
            }
        }
    }

}

#Preview {
    HomeView()
}

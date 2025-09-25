//
//  HomeView.swift
//  InfiniteCoffee
//
//  Created by ALYSSON MENEZES on 24/09/25.
//

import SwiftUI

struct HomeView: View {
    
//@StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        ZStack {
            Color.red.ignoresSafeArea()
            
            NavigationStack {
               Text("HomeView")
                
                    .navigationTitle("🍟 HomeView")
            }
        }
    }
}

#Preview {
    HomeView()
}

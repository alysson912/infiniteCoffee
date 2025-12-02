//
//  TabBarView.swift
//  InfiniteCoffee
//
//  Created by ALYSSON MENEZES on 24/09/25.
//

import SwiftUI

enum TabIdentifier: Hashable {
    case product
    //case account
    case profile
    case order
    //case settings
}


struct TabBarView: View {
    
    @State private var selectedTab: TabIdentifier = .product
    @Binding var showSignInView: Bool
    @State var productViewModel: ProductsViewModel
    
    var body: some View {
        
        TabView(selection: $selectedTab) {
           ProductsView(viewModel: productViewModel)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(TabIdentifier.product)
            
            OrderView()
                .tabItem {
                    Label("Order", systemImage: "bag")
                }
                .tag(TabIdentifier.order)
            
            ProfileView( showSignInView: $showSignInView)
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
                .tag(TabIdentifier.profile)
            
//            SettingsView(showSignInView: $showSignInView)
//                .tabItem {
//                    Label("Order", systemImage: "bag")
//                }
//                .tag(TabIdentifier.settings)
        }
        
        .tint(.marron)
        
    }
    
}
#Preview {
    TabBarView(showSignInView: .constant(false), productViewModel: ProductsViewModel())
}

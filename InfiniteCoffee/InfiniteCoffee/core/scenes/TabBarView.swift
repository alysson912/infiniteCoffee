//
//  TabBarView.swift
//  InfiniteCoffee
//
//  Created by ALYSSON MENEZES on 24/09/25.
//

import SwiftUI

enum TabIdentifier: Hashable {
    case home
    case account
    case profile
    case order
}


struct TabBarView: View {
    
    @State private var selectedTab: TabIdentifier = .home
    
    var body: some View {
        
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(TabIdentifier.home)
            
            AccountView()
                .tabItem {
                    Label("Account", systemImage: "person.fill")
                }
                .tag(TabIdentifier.account)
            
            OrderView()
                .tabItem {
                    Label("Order", systemImage: "bag")
                }
                .tag(TabIdentifier.order)
        }
        
        .tint(.marron)
        
    }
    
}
#Preview {
    TabBarView()
}

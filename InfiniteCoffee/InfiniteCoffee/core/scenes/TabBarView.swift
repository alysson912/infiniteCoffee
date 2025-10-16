//
//  TabBarView.swift
//  InfiniteCoffee
//
//  Created by ALYSSON MENEZES on 24/09/25.
//

import SwiftUI

enum TabIdentifier: Hashable {
    case home
    //case account
    case profile
    case order
    //case settings
}


struct TabBarView: View {
    
    @State private var selectedTab: TabIdentifier = .home
    @Binding var showSignInView: Bool
    
    var body: some View {
        
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(TabIdentifier.home)
            
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
    TabBarView(showSignInView: .constant(false))
}

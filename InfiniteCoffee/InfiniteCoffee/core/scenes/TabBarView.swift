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
}


struct TabBarView: View {
    
    @State private var selectedTab: TabIdentifier = .home
    
    var body: some View {
        
        TabView (selection: $selectedTab){
            Tab("Home", systemImage: "house", value: TabIdentifier.home) {
                HomeView()
            }
            
            Tab("Home", systemImage: "person.fill", value: TabIdentifier.account) {
                AccountView()
            }
            
            Tab("Order", systemImage: "bag", value: TabIdentifier.home) {
                OrderView()
            }
        }
        //        .TabViewStyle(.automatic)
        .tint(.marron)
    }
    
}
#Preview {
    TabBarView()
}

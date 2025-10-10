//
//  RootView.swift
//  InfiniteCoffee
//
//  Created by Alysson Menezes Dodo on 10/10/25.
//

import SwiftUI

struct RootView: View {
    
    @State var showSignInView: Bool = false
    
    var body: some View {
        ZStack {
            NavigationStack {
                SettingsView(showSignInView: $showSignInView)
            }
        }
        .onAppear() {
            let authUser = try? AuthenticationManager.shared.getAuthenticatedUser()
            // se o usuario logado for = anulo entao retorne verdade, se for falso entao retorne falso
            self.showSignInView = authUser == nil ? true : false
        }
        .fullScreenCover(isPresented: $showSignInView) {
            NavigationStack {
                AuthenticationView(showSignInView: $showSignInView)
            }
        }
    }
}

#Preview {
    RootView()
}

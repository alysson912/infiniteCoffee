//
//  AuthenticationView.swift
//  InfiniteCoffee
//
//  Created by Alysson Menezes Dodo on 10/10/25.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift
import Combine

@MainActor
final class AuthenticationViewModel: ObservableObject {
 
    func sigInGoogle() async throws {
        let helper = SignInGoogleHelper()
        let tokens = try await helper.signIn()
        try await AuthenticationManager.shared.signInWithGoogle(tokens: tokens)
    }
}

struct AuthenticationView: View {
    
    @StateObject var viewModel = AuthenticationViewModel()
    @Binding var showSignInView: Bool
    
    var body: some View {
        VStack {
            NavigationLink {
                SignInEmailView(showSignInView: $showSignInView)
            } label: {
                Text("Sign In With Email")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 8.0))
            }
            GoogleSignInButton(viewModel: GoogleSignInButtonViewModel(scheme: .dark, style: .wide, state: .normal)) {
                Task {
                    do {
                        try await viewModel.sigInGoogle()
                        showSignInView = false
                    } catch {
                        print(error)
                    }
                }
            }
        }
        .padding(.horizontal)
        .navigationTitle("Sign In")
    }
}

#Preview {
    NavigationStack {
        AuthenticationView(showSignInView: .constant(false))
    }
}

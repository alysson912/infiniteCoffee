//
//  AuthenticationViewModel.swift
//  InfiniteCoffee
//
//  Created by Alysson Menezes Dodo on 14/10/25.
//

import Foundation
import Combine

@MainActor
final class AuthenticationViewModel: ObservableObject {
    
    func sigInGoogle() async throws {
        let helper = SignInGoogleHelper()
        let tokens = try await helper.signIn()
        let authDataResult = try await AuthenticationManager.shared.signInWithGoogle(tokens: tokens)
        try await UserManager.shared.createUser(auth: authDataResult)
        
    }
    
    func sigInAnonymous() async throws {
      let authDataResult = try await AuthenticationManager.shared.signInAnonymous()
        try await UserManager.shared.createUser(auth: authDataResult)
    }
}

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
        let user = DBUser(auth: authDataResult)
        try await UserManager.shared.createNewUser(user: user)
        
    }
    
    func sigInAnonymous() async throws {
      let authDataResult = try await AuthenticationManager.shared.signInAnonymous()
        let user = DBUser(auth: authDataResult)
        try await UserManager.shared.createNewUser(user: user)
      
    }
}

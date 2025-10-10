//
//  SignInEmailViewModel.swift
//  InfiniteCoffee
//
//  Created by Alysson Menezes Dodo on 10/10/25.
//

import Foundation
import Combine

@MainActor
final class SignInEmailViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    func signUp() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            print("No email or password found")
            return
        }
        
        try await  AuthenticationManager.shared.createUser(email: email, password: password)

    }
    
    func signIn() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            print("No email or password found")
            return
        }
        
        try await  AuthenticationManager.shared.signInUser(email: email, password: password)

    }
}

//
//  ProfileViewModel.swift
//  InfiniteCoffee
//
//  Created by Alysson Menezes Dodo on 16/10/25.
//

import Foundation
import Combine

@MainActor
final class ProfileViewModel: ObservableObject {
    @Published private(set) var user: DBUser? = nil
    
    func loadCurrentUser() async throws {
        let authDataResult = try AuthenticationManager.shared.getAuthenticatedUser()
        self.user = try await UserManager.shared.getUser(userId: authDataResult.uid)
    }
    
    // func  para buscar novamente no back-end usuario com os dados atualizados na tela
    // adicionando dos dados pela model
    func togglePremiumStatus() {
        guard let user else { return }
        let currentValue = user.isPremium ?? false
        Task {
            try await UserManager.shared.updateUserPremiumStatus(userId: user.userId, isPremium: !currentValue)
            self.user = try await UserManager.shared.getUser(userId: user.userId)
        }
    }
    
    func addUserPreferences(text: String) {
        guard let user else { return }
        
        Task {
            try await UserManager.shared.addUserPreferences(userId: user.userId, preference: text)
            self.user = try await UserManager.shared.getUser(userId: user.userId)
        }
    }
    func removeUserPreferences(text: String) {
        guard let user else { return }
        
        Task {
            try await UserManager.shared.removeUserPreferences(userId: user.userId, preference: text)
            self.user = try await UserManager.shared.getUser(userId: user.userId)
        }
    }
    

    // MARK: adicionar UI ao informar cafe favorito
    func addFavoriteCoffe() {
        guard let user else { return }
        let coffe = Coffe(id: "1", title: "Capuccino", isPopular: true, rating: 4)
        Task {
            try await UserManager.shared.addFavoriteCoffe(userId: user.userId , coffe: coffe)
            self.user = try await UserManager.shared.getUser(userId: user.userId)
        }
    }
    
    func removeFavoriteCoffe() {
        guard let user else { return }
        
        Task {
            try await UserManager.shared.removeFavoriteCoffe(userId: user.userId)
            self.user = try await UserManager.shared.getUser(userId: user.userId)
        }
    }
}

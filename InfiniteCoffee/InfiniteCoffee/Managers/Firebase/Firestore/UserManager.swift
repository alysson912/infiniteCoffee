//
//  UserManager.swift
//  InfiniteCoffee
//
//  Created by Alysson Menezes Dodo on 14/10/25.
//

import Foundation
import FirebaseFirestore

struct Coffe: Codable {
    let id: String
    let title: String?
    let isPopular: Bool?
    let rating: Int?
}

struct DBUser: Codable {
    let userId: String
    let isAnonymous: Bool?
    let email: String?
    let photoUrl: String?
    let dateCreated: Date?
    let isPremium: Bool?
    let preferences: [String]?
    let favoriteCoffe: Coffe?
    
    init(auth: AuthDataResultModel) {
        self.userId = auth.uid
        self.isAnonymous = auth.isAnonymous
        self.email = auth.email
        self.photoUrl = auth.photoUrl
        self.dateCreated = Date()
        self.isPremium = false
        self.preferences = nil
        self.favoriteCoffe = nil
    }
    
    //MARK: Retornando um novo usuario com dados iguais ao que ja está cadastrado no banco porem, com os dados adicionais
    init(
        userId: String,
        isAnonymous: Bool? = nil,
        email: String? = nil,
        photoUrl: String? = nil,
        dateCreated: Date? = nil,
        isPremium: Bool? = nil,
        preferences: [String]? = nil,
        favoriteCoffe: Coffe? = nil
    ) {
        self.userId = userId
        self.isAnonymous = isAnonymous
        self.email = email
        self.photoUrl = photoUrl
        self.dateCreated = dateCreated
        self.isPremium = isPremium
        self.preferences = preferences
        self.favoriteCoffe = favoriteCoffe
    }
 
    enum CodingKeys: String, CodingKey {
        case userId = "user_id"
        case isAnonymous = "is_anonymous"
        case email = "email"
        case photoUrl = "photo_url"
        case dateCreated = "date_created"
        case isPremium = "user_isPremium"
        case preferences = "preferences"
        case favoriteCoffe = "favorite_coffe"
    }
    //MARK: INICIA FAZENDO A DECODIFICACAO CAMELCASE -> OBJETO
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.userId = try container.decode(String.self, forKey: .userId)
        self.isAnonymous = try container.decodeIfPresent(Bool.self, forKey: .isAnonymous)
        self.email = try container.decodeIfPresent(String.self, forKey: .email)
        self.photoUrl = try container.decodeIfPresent(String.self, forKey: .photoUrl)
        self.dateCreated = try container.decodeIfPresent(Date.self, forKey: .dateCreated)
        self.isPremium = try container.decodeIfPresent(Bool.self, forKey: .isPremium)
        self.preferences = try container.decodeIfPresent([String].self, forKey: .preferences)
        self.favoriteCoffe = try container.decodeIfPresent(Coffe.self, forKey: .favoriteCoffe)
    }
    
    
    //MARK: codificando dados (OBJETOS -> CAMELCASE) a qual o Firebase entende
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.userId, forKey: .userId)
        try container.encodeIfPresent(self.isAnonymous, forKey: .isAnonymous)
        try container.encodeIfPresent(self.email, forKey: .email)
        try container.encodeIfPresent(self.photoUrl, forKey: .photoUrl)
        try container.encodeIfPresent(self.dateCreated, forKey: .dateCreated)
        try container.encodeIfPresent(self.isPremium, forKey: .isPremium)
        try container.encodeIfPresent(self.preferences, forKey: .preferences)
        try container.encodeIfPresent(self.favoriteCoffe, forKey: .favoriteCoffe)
    }
    
 
}

final class UserManager {
    
    static let shared = UserManager()
    private init() {}
    
    private let userCollection = Firestore.firestore().collection("users")
    private func userDocument(userId: String) -> DocumentReference {
        userCollection.document(userId)
    }
    
    private let encoder: Firestore.Encoder = {
        let encoder = Firestore.Encoder()
        return encoder
    }()
    private let dencoder: Firestore.Decoder = {
        let dencoder = Firestore.Decoder()
        return dencoder
    }()
    
    
    //MARK: CRIANDO USER NO FIREBASE
    func createNewUser(user: DBUser) async throws {
        try userDocument(userId: user.userId).setData(from: user, merge: false)
    }
    
    
    //MARK: Recebendo dados do objeto, transformando em dicionario para emviar ao firebase (so recebe dados em formato de dicionario)
    func getUser(userId: String) async throws -> DBUser {
        try await userDocument(userId: userId).getDocument(as: DBUser.self)
    }
    
    //MARK: FUNC PARA INFORMAR SE O USUARIO É PREMIUM OU N
     //merge: true => mescla esses dados comj os dados ja existentes dentro do banco
    func updateUserPremiumStatus(user: DBUser) async throws {
        try userDocument(userId: user.userId).setData(from: user, merge: true)
    }
    
    // Func para alterar o status do unico dado que precisamos (evitando sobrescrecer todos os dados)
    func updateUserPremiumStatus(userId: String, isPremium: Bool) async throws {
        let data: [String: Any] = [
            DBUser.CodingKeys.isPremium.rawValue : isPremium
        ]
        try await userDocument(userId: userId).updateData(data)
    }
    
    //MARK: PREFERENCE USER
    
    //add
    func addUserPreferences(userId: String, preference: String) async throws {
        let data: [String: Any] = [
            DBUser.CodingKeys.preferences.rawValue : FieldValue.arrayUnion([preference])
            ]
        try await userDocument(userId: userId).updateData(data)
    }
    //remove
    func removeUserPreferences(userId: String, preference: String) async throws {
        let data: [String: Any] = [DBUser.CodingKeys.preferences.rawValue : FieldValue.arrayRemove([preference])]
        try await userDocument(userId: userId).updateData(data)
    }
    
    func addFavoriteCoffe(userId: String, coffe: Coffe) async throws {
        guard let data = try? encoder.encode(coffe) else {
            throw URLError(.badURL)
        }
        let dict: [String: Any] = [DBUser.CodingKeys.favoriteCoffe.rawValue : data]
        try await userDocument(userId: userId).updateData(dict)
    }
    
    func removeFavoriteCoffe(userId: String) async throws {
        let data: [String: Any?] = [DBUser.CodingKeys.favoriteCoffe.rawValue : nil]
        try await userDocument(userId: userId).updateData(data as [AnyHashable : Any])
    }
}

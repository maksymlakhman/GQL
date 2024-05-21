//
//  NetworkManager.swift
//  GQL
//
//  Created by Макс Лахман on 21.05.2024.
//

import Foundation
import Apollo

class NetworkManager {
    
    static let shared = NetworkManager()
    private(set) lazy var apolloClient: ApolloClient = makeApolloClient()
    
    private init() {}
    
    private func makeApolloClient() -> ApolloClient {
        let apolloURL = URL(string: "http://localhost:8000")!
        
        return ApolloClient(url: apolloURL)
    }
    
}

//
//  MoviesModel.swift
//  GQL
//
//  Created by Макс Лахман on 21.05.2024.
//

import Foundation
import Apollo
import SchemaGraphQL


extension GetMoviesQuery.Data.GetMovie: MoviesConvvertible {}

class MoviesModel: ObservableObject {
    @Published private(set) var movies: [Movie]
    
    init() {
        self.movies = []
    }
    
    func fetchMovie(){
        
        NetworkManager.shared.apolloClient.fetch(query: GetMoviesQuery()){ [weak self] result in
            guard let self = self else { return }
            
            
            DispatchQueue.main.async {
                switch result {
                case .success(let value):
                    if let movies = value.data?.getMovies{
                        self.movies += movies.compactMap{ $0.flatMap(Movie.init) }
                    }
                case .failure(let error):
                    debugPrint(error.localizedDescription)
                }
            }
        }
        
    }
}

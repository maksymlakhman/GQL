//
//  ContentView.swift
//  GQL
//
//  Created by Макс Лахман on 20.05.2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var moviesModel = MoviesModel()
    
    var body: some View {
        VStack {
            List(moviesModel.movies, id: \.title) { movie in
                VStack{
                    Text(movie.title)
                    Text(movie.plot)
                }
            }
        }
        .onAppear{
            moviesModel.fetchMovie()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

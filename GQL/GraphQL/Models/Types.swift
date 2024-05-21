//
//  Types.swift
//  GQL
//
//  Created by Макс Лахман on 20.05.2024.
//

import Foundation


protocol MoviesConvvertible {
    
    var title : String { get }
    var plot : String { get }
    var fullplot : String? { get }
    var cast : [String] { get }
    var directors : [String] { get }
    var countries : [String] { get }
    
}

struct Movie: MoviesConvvertible {
    
    init<T: MoviesConvvertible>(_ from: T){
        self.title = from.title
        self.plot = from.plot
        self.fullplot = from.fullplot ?? ""
        self.cast = from.cast
        self.directors = from.directors
        self.countries = from.countries
    }
    
    let title : String
    let plot : String
    let fullplot : String?
    let cast : [String]
    let directors : [String]
    let countries : [String]
}

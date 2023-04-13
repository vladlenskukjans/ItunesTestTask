//
//  AlbumModel.swift
//  ItunesTestTask
//
//  Created by Vladlens Kukjans on 13/04/2023.
//

import Foundation

struct AlbumModel: Codable, Equatable {
    let results: [Album]
    
}

struct Album: Codable, Equatable {
    let artistName: String
    let collectionName: String
    let artworkUrl100: String?
    let trackCount: Int
    let releaseDate: String
    let collectionId: Int
}

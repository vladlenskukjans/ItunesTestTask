//
//  SongsModel.swift
//  ItunesTestTask
//
//  Created by Vladlens Kukjans on 13/04/2023.
//

import Foundation

struct SongsModel: Codable {
    let results: [Songs]
}

struct Songs: Codable {
    let trackName: String?
}

//
//  NetworkFetchData.swift
//  ItunesTestTask
//
//  Created by Vladlens Kukjans on 13/04/2023.
//

import Foundation

class NetworkFetchData {
    
    static let shared = NetworkFetchData()
    private init() {}
    
    
    func fetchAlbums(urlString: String, responce: @escaping (AlbumModel?, Error?) -> Void) {
        
        NetworkRequest.shared.dataRequest(urlString: urlString) { result in
            switch result {
            case .success(let data):
               // print(data)
                do {
                    
                    let albums = try  JSONDecoder().decode(AlbumModel.self, from: data)
                    responce(albums, nil)
                    
                } catch let jsonError{
                    print("Failed to decode JSON", jsonError)
                    
                }
            case .failure(let error):
               print(error.localizedDescription)
               responce(nil, error)
            }
        }
        
    }
    
}

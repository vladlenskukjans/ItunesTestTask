//
//  NetworkRequest .swift
//  ItunesTestTask
//
//  Created by Vladlens Kukjans on 13/04/2023.
//

import Foundation


class NetworkRequest {
    
    static let shared = NetworkRequest()
    
    private init() {}
    
    
    func dataRequest(urlString: String, complition: @escaping (Result<Data, Error>) -> Void) {
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    complition(.failure(error))
                    print(error.localizedDescription)
                    return
                }
                guard let data = data else  { return }
                complition(.success(data))
            }
        }
        .resume()
    }
}

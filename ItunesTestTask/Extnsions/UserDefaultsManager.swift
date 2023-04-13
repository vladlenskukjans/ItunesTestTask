//
//  UserDefaultsManager.swift
//  ItunesTestTask
//
//  Created by Vladlens Kukjans on 13/04/2023.
//

import Foundation

class DataBase {
    
    static let shared = DataBase()
    
    
    let defaults = UserDefaults.standard
    
    var users: [Users] {
        get {
            if let data = defaults.value(forKey: "users") as? Data {
                return try! PropertyListDecoder().decode([Users].self, from: data)
            } else {
                return [Users]()
            }
        }
        
        set {
            if let data = try? PropertyListEncoder().encode(newValue) {
                defaults.set(data, forKey: "users")
            }
        }
    }
    
}

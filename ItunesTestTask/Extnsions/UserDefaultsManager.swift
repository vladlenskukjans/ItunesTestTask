//
//  UserDefaultsManager.swift
//  ItunesTestTask
//
//  Created by Vladlens Kukjans on 13/04/2023.
//

import Foundation

class DataBase {
    
    static let shared = DataBase()
    
    enum SettingKey: String {
        case users
        case activeUsers
        
    }
    
    
    let defaults = UserDefaults.standard
    let usersKey = SettingKey.users.rawValue
    var activeUser = SettingKey.activeUsers.rawValue
    
    var users: [Users] {
        get {
            if let data = defaults.value(forKey: usersKey) as? Data {
                return try! PropertyListDecoder().decode([Users].self, from: data)
            } else {
                return [Users]()
            }
        }
        set {
            if let data = try? PropertyListEncoder().encode(newValue) {
                defaults.set(data, forKey: usersKey)
            }
        }
    }
    
    func saveUser(firstName: String, secondName: String, phone: String, email: String, password: String, age: Date) {
        
        let user = Users(firstName: firstName, secondName: secondName, email: email, phone: phone, password: password, age: age)
        users.append(user)
    }
        
    var activeUsers: Users? {
        get {
            if let data = defaults.value(forKey: activeUser) as? Data {
                return try! PropertyListDecoder().decode(Users.self, from: data)
            } else {
                return nil
            }
        }
        set {
            if let data = try? PropertyListEncoder().encode(newValue) {
                defaults.set(data, forKey: activeUser)
            }
        }
    }
    
    func saveActiveUser(user: Users) {
        activeUsers = user
        
        
    }
    
}

//
//  AlertMessage.swift
//  ItunesTestTask
//
//  Created by Vladlens Kukjans on 13/04/2023.
//

import Foundation
import UIKit

extension UIViewController {
    
    func alertMessage(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        
        present(alert, animated: true)
    }
}

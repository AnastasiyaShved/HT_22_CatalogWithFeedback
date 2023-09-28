//
//  Feedback.swift
//  HT_22_CatalogWithFeedback
//
//  Created by Apple on 21.09.23.
//

import UIKit

struct Feedback {
    let date = Date()
    let text: String
    let mark: Double
}


extension Date {
    func getDate() -> String{
            let formatter = DateFormatter()
            formatter.dateFormat = "dd.mm.yyyy"
            let date = formatter.string(from: self)
            return date
    }
}
    

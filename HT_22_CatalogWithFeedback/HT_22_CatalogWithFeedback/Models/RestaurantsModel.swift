//
//  RestaurantsModel.swift
//  HT_22_CatalogWithFeedback
//
//  Created by Apple on 23.09.23.
//

import UIKit

struct RestaurantsModel {
    
    let name: String
    let address: String
    let image: UIImage?
    
    var feedBacks: [Feedback] = []
    
    var rating = "⭐️⭐️⭐️"
}

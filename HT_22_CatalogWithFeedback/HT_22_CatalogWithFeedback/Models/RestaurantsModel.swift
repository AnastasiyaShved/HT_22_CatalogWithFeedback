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
    
    var feedBacks: [Feedback] = [] {
        didSet {
            updateRating()
        }
    }
    
    var rating = ""
    // подсчет рейтинга с добавлением звезд
    private mutating func updateRating() {
        var count: Double = 0.0
        self.rating = ""
        for feed in feedBacks {
            count += feed.mark
        }
        
        for _ in 0 ..< Int(count)/feedBacks.count  {
            self.rating.append("⭐️")
        }
    }
}

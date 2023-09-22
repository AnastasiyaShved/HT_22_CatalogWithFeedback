//
//  RestaurantData.swift
//  HT_22_CatalogWithFeedback
//
//  Created by Apple on 23.09.23.
//

import UIKit

class RestaurantData {
    static let shared = RestaurantData()
    
    var restaurant: [RestaurantsModel]
    
    private init() {
        restaurant = [RestaurantsModel(name: "Друзья", address: "ул. Кульман 40, Минск", image: #imageLiteral(resourceName: "друзья.jpg")),
                      RestaurantsModel(name: "FABRIQ", address: "пр-т. Победителей 1, Минск", image:  #imageLiteral(resourceName: "фабрик.jpg")),
                      RestaurantsModel(name: "Публика", address: "пр-т. Победителей 21, Минск", image:  #imageLiteral(resourceName: "публика.jpg")),
                      RestaurantsModel(name: "Тусэ", address: "ул. Сурганова 57б, Минск", image:  #imageLiteral(resourceName: "тусэ.jpg"))]
    }
}


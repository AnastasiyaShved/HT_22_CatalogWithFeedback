//
//  RestaurantData.swift
//  HT_22_CatalogWithFeedback
//
//  Created by Apple on 23.09.23.
//

import UIKit

class RestaurantData {
    
    static let shared = RestaurantData()
    //массив ресторанов
     var restaurant: [RestaurantsModel]
    
    private init() {
        restaurant = [
            RestaurantsModel(name: "Друзья", address: "ул. Кульман 40, Минск", image: #imageLiteral(resourceName: "друзья.jpg")),
            RestaurantsModel(name: "FABRIQ", address: "пр-т. Победителей 1, Минск", image:  #imageLiteral(resourceName: "фабрик.jpg")),
            RestaurantsModel(name: "Публика", address: "пр-т. Победителей 21, Минск", image:  #imageLiteral(resourceName: "публика.jpg")),
            RestaurantsModel(name: "Тусэ", address: "ул. Сурганова 57б, Минск", image:  #imageLiteral(resourceName: "тусэ.jpg"))
        ]
    }
    //метод для получения списка ресторанов
    func getAllRestaurant() -> [RestaurantsModel] {
        return restaurant
    }
    //метод для получения ресторана по индексу
    func getRestaurant(at index: Int) -> RestaurantsModel {
        return restaurant[index]
    }
    //метод для добавления(обновления) ресторана в список
    func appendRestaurantsModel(model: RestaurantsModel) {
        //получаем индекс ресторана если такой уже есть в списке, иначе добовлем в список
        if let index = restaurant.firstIndex(where: { $0.name == model.name }) {
            //обновляем
            restaurant[index] = model
        } else {
            //добовляем
            restaurant.append(model)
        }
    }
}


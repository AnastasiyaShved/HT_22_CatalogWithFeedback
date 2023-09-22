//
//  CellManager.swift
//  HT_22_CatalogWithFeedback
//
//  Created by Apple on 23.09.23.
//

import UIKit

class CellManager {
    static func configure(cell: UITableViewCell, with restaur: RestaurantsModel) {
        cell.textLabel?.text = restaur.name
        cell.detailTextLabel?.text = restaur.address + "\n" + restaur.rating
        cell.imageView?.image = restaur.image
    }
}

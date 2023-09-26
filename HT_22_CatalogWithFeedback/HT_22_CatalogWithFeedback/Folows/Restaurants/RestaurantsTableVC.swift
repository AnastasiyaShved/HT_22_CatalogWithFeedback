//
//  RestaurantsTableVC.swift
//  HT_22_CatalogWithFeedback
//
//  Created by Apple on 23.09.23.
//

import UIKit

class RestaurantsTableVC: UITableViewController {

    var rest: [RestaurantsModel] {
        RestaurantData.shared.getAllRestaurant()
    }
    
    ///Добавили обновление таблицы при каждом показе экрана, что при возврате на этот экран у нас обновился рейтинг ресторана в зависимости он оценки в отзывах
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rest.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let restaur = rest[indexPath.row]
        
        CellManager.configure(cell: cell, with: restaur)
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */


    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // вытягиваем индекс нажатой ячейки
        guard let indexPath = tableView.indexPathForSelectedRow,
        // стучимся на новую страницу
        let detailVC = segue.destination as? DetailVC else {return}
        // вытягиваем по индексу нужный ресторан
        let restModel = RestaurantData.shared.getRestaurant(at: indexPath.row)
        // передает модельку ресторана на следующий экран
        detailVC.rest = restModel
    }
}

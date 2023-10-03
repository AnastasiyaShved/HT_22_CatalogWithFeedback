//
//  RestaurantsTableVC.swift
//  HT_22_CatalogWithFeedback
//
//  Created by Apple on 23.09.23.
//

import UIKit

class RestaurantsTableVC: UITableViewController {
   
    //MARK: - property
    var rest: [RestaurantsModel] = []
    
    //MARK: - life circle
    override func viewDidLoad() {
        rest = RestaurantData.shared.getAllRestaurant()
        self.navigationController?.navigationBar.tintColor = UIColor.darkGray
    }
    // Обновление таблицы при каждом показе экрана, чтобы при возврате на этот экран у нас обновился рейтинг ресторана в зависимости он оценки в отзывах
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
        // добавляем BarButton для последуюшего перемещения\удаления элементов
        self.navigationItem.rightBarButtonItem = self.editButtonItem
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
    // позволяет редактирование ячеек
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // удаление ячеек
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            rest.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert { }
    }
    // позволяет перемещать ячейки
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        // берем элемент для перемещения по старому адресу
        let elementToMove = rest[fromIndexPath.row]
        // удаляем элемент по старому адресу
        rest.remove(at: fromIndexPath.row)
        // добавляем новый элемент
        rest.insert(elementToMove, at: to.row)
    }
    
    // покаывает, можно  ли перемещать ячейки
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // вытягиваем индекс нажатой ячейки
        guard let indexPath = tableView.indexPathForSelectedRow,
        // стучимся на новую страницу
        let detailVC = segue.destination as? DetailVC else {return}
        // передает модельку ресторана на следующий экран
        detailVC.rest = rest[indexPath.row]
    }
}

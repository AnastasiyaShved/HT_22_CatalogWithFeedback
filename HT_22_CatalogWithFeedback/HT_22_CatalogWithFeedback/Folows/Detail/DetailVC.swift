//
//  DetailVC.swift
//  HT_22_CatalogWithFeedback
//
//  Created by Apple on 23.09.23.
//

import UIKit

class DetailVC: UIViewController {
  
    // MARK: - property
    ///тут храниться RestaurantsModel для этого экрана, которую получаем из списка ресторанов при тапе на ячйку
    var rest: RestaurantsModel? {
        /// в методе didSet (сработает при записи в  rest значения) обновит UI (showReviewBtnb и ratingLbl)
        /// а также добавит(обновит) RestaurantsModel в RestaurantData
        didSet {
            guard let rest = rest else { return }
            RestaurantData.shared.appendRestaurantsModel(model: rest)
            showReviewBtn?.setTitle("Посмотреть (\(rest.feedBacks.count)) отзывов", for: .normal)
            showReviewBtn?.isEnabled = rest.feedBacks.count != 0
            ratingLbl?.text = rest.rating
        }
    }
    
    @IBOutlet weak var detailStachView: UIStackView!
    @IBOutlet weak var imageV: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var adressLbl: UILabel!
    @IBOutlet weak var ratingLbl: UILabel!
    @IBOutlet weak var showReviewBtn: UIButton!
    
    // MARK:  - life circle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI(with: view.bounds.size)
    }
    
    // для последующих поворотов
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator){
        updateUI(with: size)
    }
    
    //MARK: - actions
   /// для перехода на этот экран по сеге
    @IBAction func unwindToDetailVC(_ segue: UIStoryboardSegue) {}
    
     //MARK: - private funcs
    private func updateUI(with size: CGSize) {
        guard let rest = rest else { return }
        // забираем размер view в CGSize, для понимания положения экрана
        let isVertical = size.width < size.height
        detailStachView.axis = isVertical ? .vertical : .horizontal
        
        //заполняем заголовок  tab bar = restaurant's name
        title = rest.name
        imageV.image = rest.image
        nameLbl.text = rest.name
        adressLbl.text = rest.address
        ratingLbl.text = rest.rating
        
        showReviewBtn.setTitle("Посмотреть (\(rest.feedBacks.count)) отзывов", for: .normal)
        showReviewBtn.isEnabled = rest.feedBacks.count != 0
    }
    
    // MARK: - navigation 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "goToFeedbackVC":
            prepareEditScreen(segue)
        default:
            break
        }
    }
    
    private func prepareEditScreen(_ segue: UIStoryboardSegue) {
    // безопасно извлекаем опциональное значение
        guard let destinationController = segue.destination as? FeedbackVC else {
            return }
        destinationController.feedbacks = rest?.feedBacks
    }

    
}

 

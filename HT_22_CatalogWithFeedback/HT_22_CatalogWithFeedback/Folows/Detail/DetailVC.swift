//
//  DetailVC.swift
//  HT_22_CatalogWithFeedback
//
//  Created by Apple on 23.09.23.
//

import UIKit

class DetailVC: UIViewController {
  
    // MARK: - property
    var index: Int!

    var rest: RestaurantsModel {
        RestaurantData.shared.restaurant[index]
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
    
    
    //MARK: - actions -
    
    
    
    
     //MARK: - private funcs -
    
    private func updateUI(with size: CGSize) {
        
        // забираем размер view в CGSize, для понимания положения экрана
        let isVertical = size.width < size.height
        detailStachView.axis = isVertical ?.vertical : .horizontal
        
        //заполняем заголовок  tab bar =  restaurant's name
        title = rest.name
        imageV.image = rest.image
        nameLbl.text = rest.name
        adressLbl.text = rest.address
        ratingLbl.text = rest.rating
        
        showReviewBtn.setTitle("Посмотреть (\(rest.feedBacks.count)) отзывов", for: .normal)
        showReviewBtn.isEnabled = rest.feedBacks.count != 0
        
    }
    
    
    
    
    
    
  
    // MARK: - Navigation

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   
    }


}

 //MARK: - private prorety -
 //MARK: - life circle -
//MARK: - actions -
 //MARK: - private funcs -
 //MARK: - novigation -

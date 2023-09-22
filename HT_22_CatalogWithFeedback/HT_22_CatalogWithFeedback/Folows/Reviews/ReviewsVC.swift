//
//  ReviewsVC.swift
//  HT_22_CatalogWithFeedback
//
//  Created by Apple on 23.09.23.
//

import UIKit

class ReviewsVC: UIViewController {

    //MARK: - property -
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var errorLbl: UILabel! {
        didSet { errorLbl.isHidden = false }
    }
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var save: UIButton!
    
    
    
    
    //MARK: - life circle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        updateUI()

    }
    
    //MARK: - actions -
    
    @IBAction func saveBtn(_ sender: UIButton) {
        save.isEnabled = textView.text.count >= 20
        
        
//        guard let tex = errorLbl.text,
//              tex.count  >= 20  else {
//            errorLbl.isHidden = true
//            return
//        }
    }
    
    
    
    //MARK: - private funcs -
  
//    private func updateUI() {
//
////        errorLbl.isHidden = false
//        guard let text = textView.text,
//                text.count >= 20
//        else {
//            errorLbl.isHidden = true
//            return
//        }
//
//
//    }
    
    //MARK: - novigation -

}



 

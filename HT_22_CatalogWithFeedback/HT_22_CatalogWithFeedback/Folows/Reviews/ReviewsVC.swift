//
//  ReviewsVC.swift
//  HT_22_CatalogWithFeedback
//
//  Created by Apple on 23.09.23.
//

import UIKit

class ReviewsVC: UIViewController, UITextViewDelegate {

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
        textView.delegate = self
    }
    
    func textViewDidChange(_ textView: UITextView) {
        guard let text = textView.text,
              text.count >= 20  else {
            errorLbl.isHidden = false
            save.isEnabled = false
            return
        }
        errorLbl.isHidden = true
        save.isEnabled = true
    }
   
    //MARK: - actions -
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
            case "unwindToDetailVC":
            prepareFirstScreen(segue)
        default:
            break
        }
    }
    
    //MARK: - private funcs -
    private func prepareFirstScreen(_ segue: UIStoryboardSegue) {
        guard let a = segue.destination as? DetailVC else { return }
        ///создаем модель коментария (берем текст из textView и значение из segmentedControl (добавили +1 т.к значение текущего index в  segmentedControl начинается с 0 ))
        let feed = Feedback(text: textView.text, mark: Double(segmentedControl.selectedSegmentIndex+1))
        //добавили коментарий в массив отзывов в модельке ресторана
        /// для нашего случая в DetailVC обновиться значение rest и у него сработает didSet
        a.rest?.feedBacks.append(feed)
    }
}



 

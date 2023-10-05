//
//  FeedbackVC.swift
//  HT_22_CatalogWithFeedback
//
//  Created by Apple on 26.09.23.
//

import UIKit

class FeedbackVC: UITableViewController {
  
    //MARK: - property
    var feedbacks: [Feedback]? = []

    //MARK: - private prorety
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Отзывы"
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let feedBacksCount = feedbacks?.count else {
            return 0
        }
        return feedBacksCount
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let onefeedbacks = feedbacks![indexPath.row]
        
        var marks = ""

        for _ in 0 ..< Int(onefeedbacks.mark)  {
            marks += "⭐️"
        }
        
        cell.textLabel?.text = "\(onefeedbacks.date.getDate())" + "\n" + marks
        cell.detailTextLabel?.text = onefeedbacks.text
    
        return cell
    }
}

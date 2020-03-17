//
//  ReviewsTableViewController.swift
//  IOSMovieProj
//
//  Created by Ahmed Awad on 3/16/20.
//  Copyright © 2020 Ahmed Awad. All rights reserved.
//

import UIKit

class ReviewsTableViewController: UITableViewController {
    
    var reviewsArray = [Review]()
  

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return reviewsArray.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ReviewsTableViewCell

        cell.authorLabel.text = reviewsArray[indexPath.row].author
        cell.content.text = reviewsArray[indexPath.row].content
        return cell
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
   


}

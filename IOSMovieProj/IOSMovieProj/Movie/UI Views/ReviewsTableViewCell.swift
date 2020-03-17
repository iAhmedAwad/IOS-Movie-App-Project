//
//  ReviewsTableViewCell.swift
//  IOSMovieProj
//
//  Created by Ahmed Awad on 3/16/20.
//  Copyright © 2020 Ahmed Awad. All rights reserved.
//

import UIKit

class ReviewsTableViewCell: UITableViewCell {

    @IBOutlet weak var authorLabel: UILabel!
  
    @IBOutlet weak var content: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

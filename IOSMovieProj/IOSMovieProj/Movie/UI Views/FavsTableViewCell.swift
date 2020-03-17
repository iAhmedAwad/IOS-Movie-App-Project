//
//  FavsTableViewCell.swift
//  IOSMovieProj
//
//  Created by Ahmed Awad on 3/17/20.
//  Copyright © 2020 Ahmed Awad. All rights reserved.
//

import UIKit
import Cosmos

class FavsTableViewCell: UITableViewCell {
    @IBOutlet weak var favImg: UIImageView!
    @IBOutlet weak var favTitle: UILabel!
    @IBOutlet weak var cosmosView: CosmosView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

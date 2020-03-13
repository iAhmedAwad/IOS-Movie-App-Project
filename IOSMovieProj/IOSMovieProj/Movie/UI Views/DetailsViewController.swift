//
//  DetailsViewController.swift
//  IOSMovieProj
//
//  Created by Ahmed Awad on 3/13/20.
//  Copyright © 2020 Ahmed Awad. All rights reserved.
//

import UIKit
import SDWebImage

class DetailsViewController: UIViewController{
 
    
    @IBOutlet weak var detailedTitle: UILabel!
    @IBOutlet weak var detailedOverview: UILabel!
    @IBOutlet weak var detailedImg: UIImageView!
    @IBOutlet weak var detailedReleaseYear: UILabel!
    var detailedMovie = Movie()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        detailedImg.sd_setImage(with: URL(string: "https://image.tmdb.org/t/p/w185" + detailedMovie.poster), placeholderImage: UIImage(named: "placeholder.png"))
        
        detailedTitle.text = detailedMovie.title
        
        
    }
    


}

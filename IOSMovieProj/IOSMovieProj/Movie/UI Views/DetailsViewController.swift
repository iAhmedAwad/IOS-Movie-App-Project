//
//  DetailsViewController.swift
//  IOSMovieProj
//
//  Created by Ahmed Awad on 3/13/20.
//  Copyright © 2020 Ahmed Awad. All rights reserved.
//

import UIKit
import SDWebImage

class DetailsViewController: UIViewController, YoutubeKeyProtocol{
 
    
    @IBOutlet weak var detailedTitle: UILabel!
    @IBOutlet weak var detailedOverview: UILabel!
    @IBOutlet weak var detailedImg: UIImageView!
    @IBOutlet weak var detailedReleaseYear: UILabel!
    var detailedMovie = Movie()
    
    
    
//    var movie = Movie()
//     var dataArray = [Movie]()
//
//     func getAllData(movieArray: [Movie]) {
//         dataArray = movieArray
//         self.collectionView.reloadData()
//     }
//
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        detailedImg.sd_setImage(with: URL(string: "https://image.tmdb.org/t/p/w185" + detailedMovie.aposter), placeholderImage: UIImage(named: "placeholder.png"))
        
        detailedTitle.text = detailedMovie.atitle
        
        
    }
    


}

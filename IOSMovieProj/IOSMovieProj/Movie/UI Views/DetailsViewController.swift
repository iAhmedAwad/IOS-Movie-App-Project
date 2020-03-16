//
//  DetailsViewController.swift
//  IOSMovieProj
//
//  Created by Ahmed Awad on 3/13/20.
//  Copyright © 2020 Ahmed Awad. All rights reserved.
//

import UIKit
import SDWebImage
import youtube_ios_player_helper
import Cosmos
class DetailsViewController: UIViewController, YoutubeKeyProtocol{
   
    
    var singleMovie = SingleMovie()
     var singleMovieArray = [SingleMovie]()
    
    func getKey(singleMovieList: [SingleMovie]) {
           singleMovieArray = singleMovieList
        
        let Str = singleMovieArray[0].key
               
        playerView.load(withVideoId: Str!)
        self.view.layoutIfNeeded()
       }
       

    @IBOutlet weak var playerView: YTPlayerView!
    
    @IBAction func trailerButton(_ sender: Any) {
        
      //  let Str = singleMovieArray[0].key
        
       // playerView.load(withVideoId: Str!)
        
        //DetailsViewController
        
       let trailersView = self.storyboard?.instantiateViewController(withIdentifier: "TrailersTableViewController") as! TrailersTableViewController
        
        trailersView.movieTrailersArray = singleMovieArray
        
          self.navigationController?.pushViewController(trailersView, animated: true)
    }
    @IBAction func favButton(_ sender: Any) {
    }
    @IBOutlet weak var detailedTitle: UILabel!
    @IBOutlet weak var detailedOverview: UILabel!
    @IBOutlet weak var detailedImg: UIImageView!
    @IBOutlet weak var detailedReleaseYear: UILabel!
    @IBOutlet weak var cosmosView: CosmosView!
    
    var detailedMovie = Movie()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailedOverview.numberOfLines = 0
        detailedOverview.sizeToFit()
        detailedImg.sd_setImage(with: URL(string: "https://image.tmdb.org/t/p/w185" + detailedMovie.aposter!), placeholderImage: UIImage(named: "placeholder.png"))
    
        detailedTitle.text = detailedMovie.atitle
        detailedOverview.text = detailedMovie.aoverview
        detailedReleaseYear.text = detailedMovie.areleaseYear
        cosmosView.rating = Double(detailedMovie.arating!)

        let network = Network(getKey: self, urlStr: detailedMovie.aid!)
               
        network.getKeyFromAPI()
        
   
    }
    


}

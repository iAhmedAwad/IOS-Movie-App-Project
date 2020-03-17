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
class DetailsViewController: UIViewController, YoutubeKeyProtocol, ReviewsProtocol{
   
    
    var singleMovie = SingleMovie()
    var singleMovieArray = [SingleMovie]()
    var reviewsArray = [Review]()
    
    func getKey(singleMovieList: [SingleMovie]) {
           singleMovieArray = singleMovieList
        
        let Str = singleMovieArray[0].key
               
        playerView.load(withVideoId: Str!)
        self.view.layoutIfNeeded()
       }
    
    func getReviews(reviewsList : [Review]){
        
        
          reviewsArray = reviewsList
        self.view.layoutIfNeeded()
    }
       

    @IBOutlet weak var playerView: YTPlayerView!
    
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
        
        
        let networkReview = Network(getReviews: self, urlReviewStr: detailedMovie.aid!)
        
        networkReview.getReviewsFromAPI()
        
        let networkTrailer = Network(getKey: self, urlStr: detailedMovie.aid!)
               
        networkTrailer.getKeyFromAPI()

    }
    

      @IBAction func trailerButton(_ sender: Any) {
          
        //  let Str = singleMovieArray[0].key
          
         // playerView.load(withVideoId: Str!)
          
          //DetailsViewController
          
         let trailersView = self.storyboard?.instantiateViewController(withIdentifier: "TrailersTableViewController") as! TrailersTableViewController
          
          trailersView.movieTrailersArray = singleMovieArray
          
            self.navigationController?.pushViewController(trailersView, animated: true)
      }
    @IBAction func revBtn(_ sender: Any) {
        
        let reviewsView = self.storyboard?.instantiateViewController(withIdentifier: "ReviewsTableViewController") as! ReviewsTableViewController
                 
                   reviewsView.reviewsArray = self.reviewsArray
                 
                   self.navigationController?.pushViewController(reviewsView, animated: true)
    }

    
}

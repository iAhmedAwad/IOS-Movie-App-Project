//
//  Network.swift
//  IOSMovieProj
//
//  Created by Ahmed Awad on 2/29/20.
//  Copyright © 2020 Ahmed Awad. All rights reserved.
//
import UIKit
import Foundation
import Alamofire
import SwiftyJSON

// My key :  0f6963deb33263bc64efce4c7b4345a5

class Network {
    var movielist = [Movie]()
    var singleMovieDetailsList = [SingleMovie]()
    var reviewsArray = [Review]()
    var getDatavar : DataGetter!
    var getKeyVar : YoutubeKeyProtocol!
    var getReviewsVar : ReviewsProtocol!
    var movieUrl : String!
    var reviewUrl : String!
    
    init(getReviews : ReviewsProtocol, urlReviewStr : Int){
        
        getReviewsVar = getReviews
        
       reviewUrl =  "https://api.themoviedb.org/3/movie/" + String(urlReviewStr) + "/reviews?api_key=0f6963deb33263bc64efce4c7b4345a5"
        
    }
    
    init (getData : DataGetter){
        getDatavar = getData
    }
    
    init (getKey : YoutubeKeyProtocol, urlStr : Int){
           
           getKeyVar = getKey
         movieUrl   = "https://api.themoviedb.org/3/movie/" + String(urlStr) + "/videos?api_key=0f6963deb33263bc64efce4c7b4345a5"

       }
    
    

    var url:String="https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key=0f6963deb33263bc64efce4c7b4345a5"
    
    func getDataFromAPI() {
        Alamofire.request(url,method:.get).responseJSON
            
            { response in
                
                var json:JSON=JSON(response.result.value!)
                
                for i in 0..<json["results"].count{
                    var mo = Movie()
                    mo.aposter = json["results"][i]["poster_path"].stringValue
                    mo.atitle = json["results"][i]["title"].stringValue
                    mo.areleaseYear = json["results"][i]["release_date"].stringValue
                    mo.aid = json["results"][i]["id"].intValue
                    //print(mo.aid)
                    mo.arating = json["results"][i]["vote_average"].floatValue/2
                    mo.aoverview = json["results"][i]["overview"].stringValue
                    
                    //append in Array
                    self.movielist.append(mo)
                   // print(mo.poster!)
                }
                
                self.getDatavar.getAllData(movieArray : self.movielist)
        
    
    }
        
}
    
    //
    
    
     func getKeyFromAPI() {
            Alamofire.request(movieUrl,method:.get).responseJSON
                
                { response in
                    
                    var json:JSON=JSON(response.result.value!)
                    
                    for i in 0..<json["results"].count{
                        var mo = SingleMovie()
                        mo.id = json["results"][i]["id"].stringValue
                       // mo.iso_639_1 = json["results"][i]["iso_639_1"].stringValue
                        //mo.iso_3166_1 = json["results"][i]["iso_3166_1"].stringValue
                        mo.key = json["results"][i]["key"].stringValue
                        //mo.name = json["results"][i]["name"].stringValue
                        //mo.site = json["results"][i]["site"].stringValue
                        //mo.type = json["results"][i]["type"].stringValue
                        //mo.size = json["results"][i]["type"].intValue
                        
                        //append in Array
                        self.singleMovieDetailsList.append(mo)
                       // print(mo.poster!)
                    }
                    
                   // self.getDatavar.getAllData(movieArray : self.movielist)
                    self.getKeyVar.getKey(singleMovieList: self.singleMovieDetailsList)
     
            
        
        }
      
            
    }
    
    
    
     func getReviewsFromAPI() {
            Alamofire.request(reviewUrl,method:.get).responseJSON
                
                { response in
                    
                    var json:JSON=JSON(response.result.value!)
                    
                    for i in 0..<json["results"].count{
                        var re = Review()
                        re.author = json["results"][i]["author"].stringValue
                        re.content = json["results"][i]["content"].stringValue
                       // re.url = json["results"][i]["url"].stringValue
                     //   re.content = json["results"][i]["content"].stringValue
                        
                        //append into array
                        self.reviewsArray.append(re)
                    }
                    

                    self.getReviewsVar.getReviews(reviewsList: self.reviewsArray)
     
            
        
        }
      
            
    }
    
    
    
    //
    
    
}

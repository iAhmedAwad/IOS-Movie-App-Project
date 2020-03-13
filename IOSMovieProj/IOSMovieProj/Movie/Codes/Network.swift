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

class Network {
    var movielist = [Movie]()
    let getDatavar : DataGetter
    
    init (getData : DataGetter){
        
        getDatavar = getData
    }
    

    
   // Alamofire.request("https://api.themoviedb.org/3/discover/movie?sort_by=popularity. desc&api_key=0f6963deb33263bc64efce4c7b4345a5").validate().responseJSON
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
                    mo.arating = json["results"][i]["vote_average"].floatValue
                    mo.aoverview = json["results"][i]["overview"].stringValue
                    
                    //append in Array
                    self.movielist.append(mo)
                   // print(mo.poster!)
                }
                
                self.getDatavar.getAllData(movieArray : self.movielist)
                //self.displayRef.fetchData(movieArr: self.movielist)        }
        
    
    }
  
        
}
}

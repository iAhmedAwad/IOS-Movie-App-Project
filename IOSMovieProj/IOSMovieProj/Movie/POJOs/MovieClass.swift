//
//  MovieClass.swift
//  IOSMovieProj
//
//  Created by Ahmed Awad on 2/29/20.
//  Copyright © 2020 Ahmed Awad. All rights reserved.
//

import Foundation

class Movie{
    
    var atitle : String?
   // var apopularity : Double?
    var aoverview : String?
    var aposter : String?
    var aid : Int?
    var arating : Float?
    var areleaseYear : String?
    
    
    init(){}
    
    init(Title : String,  Overview : String, Poster : String, Id : Int, ReleaseYear : String, Rating : Float){
        
        atitle = Title
       // apopularity = Popularity
        aoverview = Overview
        aposter = Poster
        aid = Id
        areleaseYear = ReleaseYear
        arating = Rating
        
    }
        
}


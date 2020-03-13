//
//  MovieClass.swift
//  IOSMovieProj
//
//  Created by Ahmed Awad on 2/29/20.
//  Copyright © 2020 Ahmed Awad. All rights reserved.
//

import Foundation

class Movie{
    
    var title : String!
    var popularity : Double!
    var overview : String!
    var poster : String!
    var id : Int!
    var rating : Float!
    var releaseYear : String!
    
    
    init(){}
    
    init(Title : String, Popularity : Double, Overview : String, Poster : String, Id : Int, ReleaseYear : String){
        
        title = Title
        popularity = Popularity
        overview = Overview
        poster = Poster
        id = Id
        releaseYear = ReleaseYear
        
    }
        
}

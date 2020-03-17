//
//  OfflineData.swift
//  IOSMovieProj
//
//  Created by Ahmed Awad on 3/16/20.
//  Copyright © 2020 Ahmed Awad. All rights reserved.
//

import Foundation
import SDWebImage
import CoreData

class OfflineData{
    
    var appdeleget : AppDelegate?
    var nsContext : NSManagedObjectContext?
    init(appdeleget : AppDelegate){
        self.appdeleget = appdeleget
        nsContext = appdeleget.persistentContainer.viewContext
    }
    
    func AddMovieToFavorites(movie : Movie)
    {
        let entity = NSEntityDescription.insertNewObject(forEntityName: "Favorits", into:nsContext! )
        
        entity.setValue(movie.atitle, forKey: "title")
        entity.setValue(movie.arating, forKey: "rating")
        entity.setValue(movie.aposter, forKey: "poster")
        entity.setValue(movie.aid, forKey: "id")
        
        do{
            try self.nsContext?.save()
        }
        catch
        {
            
        }
        
    }
    
    
    func AddMovieToMostPop(movie: Movie) {
        let entity = NSEntityDescription.insertNewObject(forEntityName: "RegularMovies", into:nsContext! )

            entity.setValue(movie.aid, forKey: "id")
            entity.setValue(movie.aoverview, forKey: "overview")
            entity.setValue(movie.aposter, forKey: "poster")
            entity.setValue(movie.areleaseYear, forKey: "releaseYear")
            entity.setValue(movie.arating, forKey: "rating")
            entity.setValue(movie.atitle, forKey: "title")
            
            do{
                try self.nsContext?.save()
            }
            catch
            {
                
            }
        
}
    
}

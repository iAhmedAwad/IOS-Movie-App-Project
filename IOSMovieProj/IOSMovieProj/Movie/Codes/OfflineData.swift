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
        let entity = NSEntityDescription.insertNewObject(forEntityName: "Favourites", into:nsContext! )
        
        entity.setValue(movie.atitle, forKey: "title")
        entity.setValue(movie.arating, forKey: "rating")
        entity.setValue(movie.aposter, forKey: "poster")
        entity.setValue(movie.aoverview, forKey: "overview")
        entity.setValue(movie.areleaseYear, forKey: "releaseYear")
        entity.setValue(movie.aid, forKey: "id")
        
        do{
            try self.nsContext?.save()
        }
        catch
        {
            
        }
        
    }
    
    
    func AddMovieToRegularMovies(movie: Movie) {
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
    
    
    func getFavourites()->[Any]
    {
        var movies : [Any] = []
        var myMovies = [Favourites]()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Favourites")
        myMovies = try!nsContext!.fetch(fetchRequest) as![Favourites]
        for movie in myMovies
        {
            movies.append(movie)
        }
        return movies
    }
    
    func getRegularMovies() -> [Any] {
        var movies : [Movie] = []
        var myMovies = [RegularMovie]()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "RegularMovie")
        myMovies = try!nsContext!.fetch(fetchRequest) as! [RegularMovie]
        for movie in myMovies
        {
            var myMovie = Movie(Title: movie.title!, Overview: movie.overview!, Poster: movie.poster!, Id: Int(movie.id), ReleaseYear: movie.releaseYear!, Rating: movie.rating)
            movies.append(myMovie)
        }
        return movies
    }
    
    func doExistFavs(id : Int)->Bool
    {
        var exist = false
        let entity = NSEntityDescription.entity(forEntityName: "Favourites", in: nsContext!)
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Favourites")
        fetchRequest.entity = entity
        let pred = NSPredicate(format:"id=%d", id)
        fetchRequest.predicate=pred
        do
        {
            let result = try nsContext?.fetch(fetchRequest)
            print(result?.count)
            if result!.count > 0 {
                exist = true
            }
        }
        catch
        {
            
        }
        return exist
    }
    
    
    
    func deleteMoviesFromFav(id : Int){
        let entity = NSEntityDescription.entity(forEntityName: "Favourites", in: nsContext!)
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Favourites")
        fetchRequest.entity = entity
        let pred = NSPredicate(format:"id=%d", id)
        fetchRequest.predicate=pred
        do
        {
            let result = try nsContext?.fetch(fetchRequest)
            //print(result?.count)
            if result!.count > 0 {
                let manage = result![0] as! NSManagedObject
                nsContext?.delete(manage)
                try nsContext?.save()
            }
        }
        catch
        {
            
        }

        
    }
    
    
}

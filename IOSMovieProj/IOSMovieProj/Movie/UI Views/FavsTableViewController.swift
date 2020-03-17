//
//  FavsTableViewController.swift
//  IOSMovieProj
//
//  Created by Ahmed Awad on 3/17/20.
//  Copyright © 2020 Ahmed Awad. All rights reserved.
//

import UIKit

class FavsTableViewController: UITableViewController {
    
    var movieList : [Favourites]?
      var coreData : OfflineData?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        var coredata = OfflineData(appdeleget: UIApplication.shared.delegate as! AppDelegate)
        movieList = coredata.getFavourites()as! [Favourites]
        self.tableView.reloadData()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movieList!.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FavsTableViewCell

        cell.favImg.sd_setImage(with: URL(string: "https://image.tmdb.org/t/p/w185" + movieList![indexPath.row].poster!), placeholderImage: UIImage(named: "placeholder.png"))
        
        cell.favTitle.text = movieList![indexPath.row].title
        cell.cosmosView.rating = Double(movieList![indexPath.row].rating)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var mo = Movie(Title: movieList![indexPath.row].title!, Overview: movieList![indexPath.row].overview!, Poster: movieList![indexPath.row].poster!, Id: Int(movieList![indexPath.row].id), ReleaseYear: movieList![indexPath.row].releaseYear! , Rating: movieList![indexPath.row].rating)
                let detailedView = self.storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        
        detailedView.detailedMovie = mo
        
                self.navigationController?.pushViewController(detailedView, animated: true)
    }
    
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        coreData?.deleteMoviesFromFav(id: Int(movieList![indexPath.row].id))
        
        self.tableView.reloadData()
        
    }
    
}

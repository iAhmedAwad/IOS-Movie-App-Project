//
//  HomeCollectionView.swift
//  IOSMovieProj
//
//  Created by Ahmed Awad on 3/12/20.
//  Copyright © 2020 Ahmed Awad. All rights reserved.
//

import UIKit
import SDWebImage

private let reuseIdentifier = "Cell"

class HomeCollectionView: UICollectionViewController, DataGetter, UICollectionViewDelegateFlowLayout {
    
    var movie = Movie()
    var dataArray = [Movie]()

    func getAllData(movieArray: [Movie]) {
        dataArray = movieArray
        self.collectionView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
   
        let network = Network(getData: self)
 
        network.getDataFromAPI()
        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

     let height = collectionView.frame.size.height
     let width = collectionView.frame.size.width
     if(height > width)
     {
     // in case you you want the cell to be 40% of your controllers view
         return CGSize(width: width * 0.5, height: 266)
     }
     else{
         return CGSize(width: width * 0.25, height: 266)
     }
    }
    
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
         return 0;
     }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! MyCollectionViewCell
    
        // Configure the cell
    
        cell.img.sd_setImage(with: URL(string: "https://image.tmdb.org/t/p/w185" + dataArray[indexPath.row].aposter!), placeholderImage: UIImage(named: "placeholder.png"))
    
        return cell
    }

    
        
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        
                let detailedView = self.storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        
                detailedView.detailedMovie = dataArray[indexPath.row]
        
                self.navigationController?.pushViewController(detailedView, animated: true)
        
        
    }
 

}
  



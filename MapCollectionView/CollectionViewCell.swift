//
//  CollectionViewCell.swift
//  MapCollectionView
//
//  Created by Mayank on 22/08/17.
//  Copyright © 2017 Mayank. All rights reserved.
//

import UIKit
import MapKit
class CollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var button: UIButton!
    var delegate:ViewController?
    var mapDelegate:MapInfoDelegate?
    var index:IndexPath?
    @IBAction func changeLocation(_ sender: UIButton) {
        let path = sender.tag
        var currentCoordinates:CLLocationCoordinate2D?
        let goingLocation = delegate?.locationCoordinates[path]
        var locationName: String?
        delegate?.collectionView.bringSubview(toFront: button)
        for (key) in (goingLocation?.keys)!
        {
            locationName = key
        }
        for value in (goingLocation?.values)!
        {
            currentCoordinates = value
        }
        if let mapDelegate = self.mapDelegate
        {
            mapDelegate.updateTheMap(locationName: locationName!, coordinates: currentCoordinates!)
        }
        delegate?.collectionView.scrollToItem(at: index!, at: .centeredHorizontally, animated: true)
        print("tag:\(path)")
 
    }
    
}


protocol MapInfoDelegate {
    func updateTheMap(locationName:String , coordinates:CLLocationCoordinate2D)
}



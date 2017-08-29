//
//  ViewController.swift
//  MapCollectionView
//
//  Created by Mayank on 22/08/17.
//  Copyright © 2017 Mayank. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,MapInfoDelegate {
    
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var collectionView: UICollectionView!
   // let cood:CLLocationCoordinate2D = CLLocationCoordinate2DMake(12.9734225, 77.62046850000002)
    var locationCoordinates = [
        ["Lido Mall":CLLocationCoordinate2DMake(12.9734225, 77.62046850000002)],
        ["BBQNation":CLLocationCoordinate2DMake(12.9626145, 77.64144729999998)],
        ["EGL":CLLocationCoordinate2DMake(12.9513154,77.64645339999993)],
        ["AXIS Bank":CLLocationCoordinate2DMake(12.9561708, 77.6952043)],
        ["Lido Mall":CLLocationCoordinate2DMake(12.9734225, 77.62046850000002)],
        ["BBQNation":CLLocationCoordinate2DMake(12.9626145, 77.64144729999998)],
        ["EGL":CLLocationCoordinate2DMake(12.9513154,77.64645339999993)],
        ["AXIS Bank":CLLocationCoordinate2DMake(12.9561708, 77.6952043)],
        ["Lido Mall":CLLocationCoordinate2DMake(12.9734225, 77.62046850000002)],
        ["BBQNation":CLLocationCoordinate2DMake(12.9626145, 77.64144729999998)],
        ["EGL":CLLocationCoordinate2DMake(12.9513154,77.64645339999993)],
        ["AXIS Bank":CLLocationCoordinate2DMake(12.9561708, 77.6952043)]

    ]
    var buttonColor = [UIColor.red , UIColor.black, UIColor.yellow , UIColor.green,UIColor.red , UIColor.black, UIColor.yellow , UIColor.green,UIColor.red , UIColor.black, UIColor.yellow , UIColor.green]
    
    override func viewDidLoad() {
        self.collectionView.allowsSelection = true
        super.viewDidLoad()
       //((UICollectionViewFlowLayout)(self.collectionView.collectionViewLayout).mi
//        ((UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout).minimumLineSpacing = 1000.0f
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        let cood:CLLocationCoordinate2D = CLLocationCoordinate2DMake(12.9574508, 77.64157069999999)
        let distanceSpan:CLLocationDegrees = 1000
        mapView.setRegion(MKCoordinateRegionMakeWithDistance(cood,distanceSpan,distanceSpan), animated: true)
        mapView.showsUserLocation = true
        let pinLocation = PinLocation(title: "Unitus Technology Center",coordinate: cood)
        mapView.addAnnotation(pinLocation)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func updateTheMap(locationName:String , coordinates:CLLocationCoordinate2D)
    {
        mapView.setRegion(MKCoordinateRegionMakeWithDistance(coordinates, 1000, 1000), animated: true)
        let pinLocation = PinLocation(title: locationName,coordinate: coordinates)
        mapView.addAnnotation(pinLocation)
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return locationCoordinates.count
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        //put the Delgate HERE in the place where the cell is instantiated so that there is a connection back
        cell.mapDelegate = self
        cell.delegate = self
        cell.button.backgroundColor = buttonColor[indexPath.item]
        cell.button.tag = indexPath.row
        let goingLocation = locationCoordinates[indexPath.item]
        var locationName:String?
        var currentCoordinates:CLLocationCoordinate2D?
        for (key) in goingLocation.keys
        {
             locationName = key
        }
        for value in goingLocation.values
        {
            currentCoordinates = value
        }
//        cell.cood[indexPath.row] = currentCoordinates!
//        cell.name[indexPath.row] = locationName!
//        print(indexPath.item)
//        print("tag of cell =\(cell.tag)")
        cell.button.setTitle(locationName, for: UIControlState.normal)
        return cell
    }
    

   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


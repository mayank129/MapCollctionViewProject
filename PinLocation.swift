//
//  PinLocation.swift
//  MapCollectionView
//
//  Created by Mayank on 22/08/17.
//  Copyright © 2017 Mayank. All rights reserved.
//

import Foundation
import MapKit
class  PinLocation: NSObject,MKAnnotation {
    var title: String?
    var coordinate: CLLocationCoordinate2D
 init(title:String, coordinate:CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
    }
}

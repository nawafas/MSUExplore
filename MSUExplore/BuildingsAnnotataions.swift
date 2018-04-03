//
//  BuildingsAnnotataions.swift
//  MSUExplore
//
//  Created by Nawaf alsudairy on 6/24/1439 AH.
//  Copyright © 1439 AH Nawaf alsudairy. All rights reserved.
//

import MapKit

class BuildingsAnnotataions: NSObject, MKAnnotation{
var title: String?
var subtitle: String?
var coordinate: CLLocationCoordinate2D
   
    init(buildingName: String, buildingInfo:String, buildingCoordinates: CLLocationCoordinate2D) {
        self.title = buildingName
        self.subtitle = buildingInfo
        self.coordinate = buildingCoordinates
    }
    
}

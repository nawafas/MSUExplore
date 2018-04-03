//
//  ViewController.swift
//  MSUExplore
//
//  Created by Nawaf alsudairy on 6/24/1439 AH.
//  Copyright © 1439 AH Nawaf alsudairy. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class ViewController: UIViewController {
    // this is a areference for the map in the View
    @IBOutlet weak var myMap: MKMapView!
    let locationManager: CLLocationManager = CLLocationManager()
    // this function will execute once this view is loaded.
    override func viewDidLoad() {
        super.viewDidLoad()
        myMap.delegate = self
        
        locationManager.requestWhenInUseAuthorization()
        
        // if user allowed us to access the lcation, then set up the lcation manager attributes.
        if  CLLocationManager.locationServicesEnabled(){
            
            locationManager.delegate = self
             myMap.showsUserLocation = true
            mapSetup()
            annotataionsSetup()
        }
        
       
    }
    private func mapSetup(){
        let regionCoordinates2D: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 37.2006, longitude: -93.2807)
        let regionSpan: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
       
        
        let regionCoordinates: MKCoordinateRegion = MKCoordinateRegion(center: regionCoordinates2D, span: regionSpan)
        
        myMap.setRegion(regionCoordinates, animated: true)
        
        
    }
    
    
    private func annotataionsSetup(){
        
        
        let  glassHall: BuildingsAnnotataions = BuildingsAnnotataions(buildingName: "Glass Hall", buildingInfo: "Address: 851 S John Q Hammons Pkwy, Springfield, MO 65897 \n Phone: (417) 836-5000", buildingCoordinates: CLLocationCoordinate2D(latitude: 37.1992, longitude: -93.2830))
        
        // to add me more annotation follow the same initialize for glass hall and then store them in an array
        
        myMap.addAnnotation(glassHall)
    
    
    
    
    
    
    }

}
extension ViewController: MKMapViewDelegate{
    
    
//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//        if annotation is MKUserLocation {
//            return nil
//        }
//
//        else {
//            let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "annotationView") ?? MKAnnotationView()
//            if annotationView == nil{
//
//               let  annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "annotationView")
//                return annotationView
//            }
//            annotationView.annotation = annotation as! BuildingsAnnotataions
//            annotationView.canShowCallout = true
//            annotationView.rightCalloutAccessoryView = UIButton()
//
//            let imageButton: UIButton = UIButton()
//            imageButton.setImage(UIImage(named:"glassHall"), for: UIControlState())
//            annotationView.leftCalloutAccessoryView = imageButton
//
//
//            return annotationView
//        }
//

    
//
//   }
}
extension ViewController: CLLocationManagerDelegate{
    
    
    
    
    
    
    
    
}

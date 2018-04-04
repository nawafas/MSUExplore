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
    // this is a reference for the map in the View
    @IBOutlet weak var myMap: MKMapView!
    let locationManager: CLLocationManager = CLLocationManager()
    // this function will execute once this view is loaded.
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "MSUExplore"
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
        myMap.mapType = .hybridFlyover
        
        
    }
    @objc public func goToDetails(_sender: UIButton){
        
        self.performSegue(withIdentifier: "detailViewPage", sender: self)
        
    }
    
    
    
    private func annotataionsSetup(){
        var annotationArray = [BuildingsAnnotataions]()
        // to add another building: add the buidling name to the end if the buildingNameArray, followed by the building coordinate in the buildingCoordinateArray.
        // insert all new anootation information to the end of both arrays, otherwise, it won't work. 
        
        let buildingNameArray: [String] = ["Cheek Hall","Ellis Hall","Hill Hall","Siceluff Hall","Carrington Hall","Craig Hall","Art Annex","Karls Hall","Pummill Hall","McDonald Hall & Arena","Duane G. Meyer Library","Temple Hall","Kings Street Annex","Bill R. Foster and Family Recreation Center","Kemper Hall","Strong Hall","Glass Hall"]

        let buidlingCoordinatesArray: [CLLocationCoordinate2D] = [CLLocationCoordinate2D(latitude: 37.1993, longitude: -93.2767),CLLocationCoordinate2D(latitude: 37.1978, longitude: -93.2768),CLLocationCoordinate2D(latitude: 37.198005, longitude: -93.277423),CLLocationCoordinate2D(latitude: 37.1992, longitude:  -93.2776),CLLocationCoordinate2D(latitude: 37.1986, longitude: -93.2786),CLLocationCoordinate2D(latitude: 37.1972, longitude:  -93.2775),CLLocationCoordinate2D(latitude: 37.196984, longitude: -93.278502),CLLocationCoordinate2D(latitude: 37.1974, longitude: -93.2784),CLLocationCoordinate2D(latitude: 37.1979, longitude: -93.2787),CLLocationCoordinate2D(latitude: 37.1989, longitude: -93.2798),CLLocationCoordinate2D(latitude: 37.1992, longitude: -93.2813),CLLocationCoordinate2D(latitude: 37.1981, longitude: -93.2815),CLLocationCoordinate2D(latitude: 37.2001, longitude: -93.2808),CLLocationCoordinate2D(latitude: 37.2009, longitude: -93.2810),CLLocationCoordinate2D(latitude: 37.1973, longitude: -93.2830),CLLocationCoordinate2D(latitude: 37.1986, longitude: -93.2844),CLLocationCoordinate2D(latitude: 37.1992, longitude: -93.2830)]
        let contactNumber: String = "(417)836-5000"
    
        for (index, _) in buildingNameArray.enumerated(){
            
            let eachBuildingName: String = buildingNameArray[index]
            let eachBuildingCoordinates: CLLocationCoordinate2D = buidlingCoordinatesArray[index]
            let currentBuildingAnnotation: BuildingsAnnotataions = BuildingsAnnotataions(buildingName: eachBuildingName, buildingInfo: contactNumber, buildingCoordinates: eachBuildingCoordinates)
            
            annotationArray.append(currentBuildingAnnotation)
            
            
        }
        myMap.addAnnotations(annotationArray)
    
    
    
    }

}
extension ViewController: MKMapViewDelegate{
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation
        {
            return nil
        }
        if let annotation = annotation as? MKAnnotation{
            let identifier = "marker"
            print("before enqueue")
            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier){
                dequeuedView.annotation = annotation
                if view == nil{
                    print("empty view")
                    view = dequeuedView
                }
                
            }
            else{
                
                if #available(iOS 11.0, *) {
                    let markerView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                    let myCustomButton = UIButton(type: .detailDisclosure)
                    myCustomButton.accessibilityIdentifier = "viewCalloutButton"
                    myCustomButton.addTarget(self, action: #selector(goToDetails), for: .touchUpInside)
                    markerView.rightCalloutAccessoryView = myCustomButton
                    
                    
                    let annotationImage = UIImage(named:"\(((markerView.annotation!.title)!)!).jpg")
                    // creating the image view as a clickable button
                    let imageButton = UIButton(type: .custom)
                    
                    // assigning the frame attributes to locate and resize the defualt right callout
                   imageButton.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
                    imageButton.setImage(annotationImage, for: UIControlState())
                    // swaping the image view with the lef tcallout view
                    markerView.leftCalloutAccessoryView = imageButton
                    
                    
                    markerView.canShowCallout = true
                  
                    markerView.glyphText = "🏫"
                    markerView.markerTintColor = #colorLiteral(red: 0.5732609034, green: 0.06602973491, blue: 0.025112167, alpha: 1)
                    return markerView
                    
                    
                    
                }
                
            }
            print("nil")
            return nil
        }
    }
}
    


extension ViewController: CLLocationManagerDelegate{
    
    
    
    
    
    
    
    
}

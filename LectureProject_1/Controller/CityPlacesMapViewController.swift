//
//  CityPlacesMapViewController.swift
//  LectureProject_1
//
//  Created by Rustem Manafov on 17.07.22.
//

import UIKit
import MapKit

class CityPlacesMapViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var PlacesMapView: MKMapView!
    
    var cityMap: CityPlaces?

    var manager = CLLocationManager()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
//        manager.location?.coordinate.latitude = cityMap?.coordinatex
//        manager.location?.coordinate.longitude = cityMap?.coordinatey

    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let location = locations.first {
            manager.stopUpdatingLocation()
            
            let coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude,
                                                    longitude: location.coordinate.latitude)
            
            let span = MKCoordinateSpan(latitudeDelta: 5, longitudeDelta: 5)
            let region = MKCoordinateRegion(center: coordinate, span: span)
        PlacesMapView.setRegion(region, animated: true)
            
            let pin = MKPointAnnotation()
            pin.coordinate = coordinate
            pin.title = "I am here"
        PlacesMapView.addAnnotation(pin)
            
        }
        
    }


}

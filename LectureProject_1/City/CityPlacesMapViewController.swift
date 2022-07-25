//
//  CityPlacesMapViewController.swift
//  LectureProject_1
//
//  Created by Rustam Manafov on 17.07.22.
//

import UIKit
import MapKit

class CityPlacesMapViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var PlacesMapView: MKMapView!
    
    var cityMap: CityPlaces?
    
    var manager = CLLocationManager()
    
    var latitude = ""
    var longitude = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        
        manager.stopUpdatingLocation()
        
        let coordinate = CLLocationCoordinate2D(latitude: Double(latitude) ?? 0,
                                                longitude: Double(longitude) ?? 0)
        let span = MKCoordinateSpan(latitudeDelta: 5, longitudeDelta: 5)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        PlacesMapView.setRegion(region, animated: true)
        
        let pin = MKPointAnnotation()
        pin.coordinate = coordinate
        pin.title = "I am here"
        PlacesMapView.addAnnotation(pin)
        
        
        
    }
    
    
}

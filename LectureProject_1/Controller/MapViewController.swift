//
//  MapViewController.swift
//  LectureProject_1
//
//  Created by Rustam Manafov on 13.07.22.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var segmentOutlet: UISegmentedControl!
    
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
        mapView.setRegion(region, animated: true)
        
        let pin = MKPointAnnotation()
        pin.coordinate = coordinate
        pin.title = "I am here"
        mapView.addAnnotation(pin)
        
        
    }
    
    @IBAction func findMe(_ sender: Any) {
        manager.startUpdatingLocation()
        mapView.showsUserLocation = true
        
    }
    
    @IBAction func selectMapType(_ sender: Any) {
        
        switch segmentOutlet.selectedSegmentIndex{
            
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .satellite
        default:
            mapView.mapType = .hybrid
            break
            
        }
    }
    
    
    
    
}

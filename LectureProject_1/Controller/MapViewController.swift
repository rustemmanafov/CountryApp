//
//  MapViewController.swift
//  LectureProject_1
//
//  Created by Rustem Manafov on 13.07.22.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate {
    
    var locationArrLat = ["40,3754434","40,6798083", "39.7591707" ]
    var locationArrLon = ["49,8326748", "46,3597178", "46.7511227"]
    

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var segmentOutlet: UISegmentedControl!
    
    var manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()

    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let location = locations.first{
            manager.stopUpdatingLocation()
            
            let coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude,
                                                    longitude: location.coordinate.longitude)
            let span = MKCoordinateSpan(latitudeDelta: 20, longitudeDelta: 20)
            let region = MKCoordinateRegion(center: coordinate, span: span)
            mapView.setRegion(region, animated: true)
            
            let pin = MKPointAnnotation()
            pin.coordinate = coordinate
            pin.title = "I am here"
            mapView.addAnnotation(pin)
            
        }
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

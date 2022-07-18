//
//  CityDetailsViewController.swift
//  LectureProject_1
//
//  Created by Rustam Manafov on 16.07.22.
//

import UIKit

class CityDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var cityPlaces = [CityPlaces]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
    }
    
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cityPlaces.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityDetailTableViewCell", for: indexPath) as! CityDetailTableViewCell
        cell.DetailImageView.image = UIImage(named: cityPlaces[indexPath.row].image)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "CityPlacesMapViewController") as! CityPlacesMapViewController
        
        controller.latitude = cityPlaces[indexPath.row].coordinatex
        controller.longitude = cityPlaces[indexPath.row].coordinatey
        controller.title = cityPlaces[indexPath.row].name
        navigationController?.show(controller, sender: nil)
    }
}

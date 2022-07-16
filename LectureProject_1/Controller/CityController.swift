//
//  CityController.swift
//  LectureProject_1
//
//  Created by Shamkhal Guliyev on 25.06.22.
//

import UIKit
import CoreLocation
import MapKit

class CityController: UIViewController {

    var city: CityModel?

    @IBOutlet weak var cityImage: UIImageView!
    @IBOutlet weak var cityInfoTextView: UITextView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = city?.name
        cityImage.image = UIImage(named: city?.image ?? "")
        cityInfoTextView.text = city?.text
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Show Location", style: .plain, target: self, action: #selector(addTapped))
        

    }
    
    @objc func addTapped(){
        print("Worked")
        
        let controller = storyboard?.instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
        controller.latitude = city?.coordinatex ?? ""
        controller.longitude = city?.coordinatey ?? ""

        show(controller, sender: nil)
        
    }
}

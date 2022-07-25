//
//  CityController.swift
//  LectureProject_1
//
//  Created by Rustam Manafov on 25.06.22.
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
        
        // show citydetail vc
        cityImage.isUserInteractionEnabled = true
        cityImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:))))
        
        title = city?.name
        cityImage.image = UIImage(named: city?.image ?? "")
        cityInfoTextView.text = city?.text
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Show Location", style: .plain, target: self, action: #selector(addTapped))
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer){
        let controller = storyboard?.instantiateViewController(withIdentifier: "CityDetailsViewController") as! CityDetailsViewController
        controller.cityPlaces = city?.cityPlaces ?? []
        navigationController?.show(controller, sender: nil)
    }
    
    @objc func addTapped(){
        print("Worked")
        
        let controller = storyboard?.instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
        controller.latitude = city?.coordinatex ?? ""
        controller.longitude = city?.coordinatey ?? ""

        show(controller, sender: nil)
        
    }
}

//
//  CityDetailsViewController.swift
//  LectureProject_1
//
//  Created by Rustem Manafov on 16.07.22.
//

import UIKit

class CityDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    //    var arr = ["15783565219_bf79b50510_b.jpg", "bakuboulevard1.jpg", "sehidler-xiyabani.jpg" ]
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
}

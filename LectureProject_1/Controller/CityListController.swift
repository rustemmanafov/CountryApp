//
//  CityListController.swift
//  LectureProject_1
//
//  Created by Shamkhal Guliyev on 25.06.22.
//

import UIKit
import ProgressHUD

class CityListController: UIViewController {

    var citymodel = [CityModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ProgressHUD.showSucceed()
    }
    
}

extension CityListController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        citymodel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CityCell", for: indexPath) as! CityCell
        cell.cityImage.image = UIImage(named: citymodel[indexPath.row].image)
        cell.titleLabel.text = citymodel[indexPath.row].name
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "CityController") as! CityController
        controller.city = citymodel[indexPath.row]
        navigationController?.show(controller, sender: nil)
    }
    

}

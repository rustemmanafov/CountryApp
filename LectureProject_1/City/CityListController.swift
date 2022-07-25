//
//  CityListController.swift
//  LectureProject_1
//
//  Created by Rustam Manafov on 25.06.22.
//

import UIKit
import ProgressHUD

class CityListController: UIViewController {
    
    var citymodel = [CityModel]()
    
    let animationDuration: Double = 1.0
    let delayBase: Double = 1.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ProgressHUD.showSucceed()
    }
    
    func gridAnimation(cell: UICollectionViewCell, index: IndexPath){
        UIView.animate(withDuration: animationDuration) {
            cell.alpha = 1
            
            let delay = sqrt(Double(index.row)) * self.delayBase
            UIView.animate(withDuration: self.animationDuration, delay: delay, options: .curveEaseOut, animations: {
                cell.alpha = 1
            })
        }
        let column = Double(cell.frame.minX / cell.frame.width)
        let row = Double(cell.frame.minY / cell.frame.height)
        let distance = sqrt(pow(column, 2) + pow(row, 2))
        let a = sqrt(distance) * delayBase
        UIView.animate(withDuration: animationDuration, delay: a, options: [], animations: {
            cell.alpha = 1
        })
        
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
        cell.alpha = 0
        gridAnimation(cell: cell, index: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "CityController") as! CityController
        controller.city = citymodel[indexPath.row]
        navigationController?.show(controller, sender: nil)
    }
    
    
}

//
//  CityCell.swift
//  LectureProject_1
//
//  Created by Shamkhal Guliyev on 28.06.22.
//

import UIKit

class CityCell: UICollectionViewCell {
    
    @IBOutlet weak var cityImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
   
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cityImage.layer.cornerRadius = 30
    }
    
}

//
//  CityDetailTableViewCell.swift
//  LectureProject_1
//
//  Created by Rustem Manafov on 16.07.22.
//

import UIKit

class CityDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var DetailImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        DetailImageView.layer.cornerRadius = 10
       
    }

   
    
   

}

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

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

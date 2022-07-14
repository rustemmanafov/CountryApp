//
//  NewTableViewCell.swift
//  LectureProject_1
//
//  Created by Rustem Manafov on 30.06.22.
//

import UIKit

protocol NewTableViewCellDelegate {
    func actionButtonCalled(index: Int)
}

class NewTableViewCell: UITableViewCell {
    
    @IBOutlet weak var newLAbel: UILabel!
    @IBOutlet weak var newButtonOutlet: UIButton!
    
    var delegate: NewTableViewCellDelegate?
    
   // var buttonCallBack: ((Int)-> ())?

    override func awakeFromNib() {
        super.awakeFromNib()
        
        newButtonOutlet.layer.cornerRadius = 20
        newButtonOutlet.layer.cornerRadius = 10
        newButtonOutlet.backgroundColor = UIColor.purple
    }
   
    @IBAction func buttonTapped(_ sender: Any) {
        
        delegate?.actionButtonCalled(index: tag)
        
      // buttonCallBack?(tag)
    }
    
}


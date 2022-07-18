//
//  ProfileViewController.swift
//  LectureProject_1
//
//  Created by Rustam Manafov on 09.07.22.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var profile: User?
    
    @IBOutlet weak var firstNameLbl: UITextField!
    @IBOutlet weak var lastNameLbl: UITextField!
    @IBOutlet weak var emailLbl: UITextField!
    @IBOutlet weak var passwordLbl: UITextField!
    @IBOutlet weak var genderLbl: UITextField!
    @IBOutlet weak var imageLbl: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstNameLbl.text = profile?.firstName
        lastNameLbl.text = profile?.lastName
        emailLbl.text = profile?.email
        passwordLbl.text = profile?.password
        genderLbl.text = profile?.gender
        
        

    }
    

   

}

//
//  ProfileViewController.swift
//  LectureProject_1
//
//  Created by Rustam Manafov on 09.07.22.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var profile: User?
    var jsonData = URL(string: "")
    var users = [User]()
    
    @IBOutlet weak var firstNameLbl: UITextField!
    @IBOutlet weak var lastNameLbl: UITextField!
    @IBOutlet weak var emailLbl: UITextField!
    @IBOutlet weak var passwordLbl: UITextField!
    @IBOutlet weak var genderLbl: UITextField!
    @IBOutlet weak var imageLbl: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        jsonCalled()
    }
    
    func setupUI() {
        firstNameLbl.text = profile?.firstName
        lastNameLbl.text = profile?.lastName
        emailLbl.text = profile?.email
        passwordLbl.text = profile?.password
        genderLbl.text = profile?.gender
    }
    
    func findLoggedUser() {
        let loggedMail = UserDefaults.standard.string(forKey: "loggedMail")
        
        for user in users {
            if(user.email == loggedMail) {
                profile = user
                setupUI()
            }
        }
    }
    
    func getDocumentsDirectoryUrl() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    
    func jsonCalled() {
        jsonData = getDocumentsDirectoryUrl().appendingPathComponent("Users.json")
        if let file = jsonData, let data = try? Data(contentsOf: file) {
            do {
                users = try JSONDecoder().decode([User].self, from: data)
                findLoggedUser()
            } catch {
                print(error.localizedDescription)
                print("error")
            }
        }
    }
}

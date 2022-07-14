//
//  RegisterViewController.swift
//  LectureProject_1
//
//  Created by Rustem Manafov on 09.07.22.
//

import UIKit

var fileName = "saveInputs.json"

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var enterOutlet: UIButton!
    
    var users = [User]()
    var pickerView = UIPickerView()
    var genderArr = ["Male", "Female"]
    var jsonFile = URL(string: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        genderTextField.inputView = pickerView
        
        jsonFile = getDocumentsDirectoryUrl().appendingPathComponent("Users.json")
    }
    
    @IBAction func enterAction(_ sender: Any) {
        jsonSetup()
    }
    
    func getDocumentsDirectoryUrl() -> URL{
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    
    func jsonSetup() {
        if let file = jsonFile, let data = try? Data(contentsOf: file) {
            do {
                users = try JSONDecoder().decode([User].self, from: data)
                writeToFile()
            } catch {
                print(error.localizedDescription)
            }
        } else {
            writeToFile()
        }
    }
    
    func writeToFile() {
        let user = User(firstName: firstNameTextField.text!, lastName: lastNameTextField.text!, email: emailTextField.text!, password: passwordTextField.text!, gender: genderTextField.text!)
        users.append(user)
        do {
            let data = try JSONEncoder().encode(users)
            try data.write(to: jsonFile!)
            
        } catch {
            print("Why dont work?")
        }
    }
    
}

// gender picker view
extension RegisterViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genderArr.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genderArr[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        genderTextField.text = genderArr[row]
        genderTextField.resignFirstResponder()
    }
    
    
}

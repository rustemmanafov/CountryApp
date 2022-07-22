
//  LoginViewController.swift
//  LectureProject_1
//
//  Created by Rustam Manafov on 02.07.22.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var buttonLabel: UIButton!
    @IBOutlet weak var animationView: UIView!
    @IBOutlet weak var animationLabel: UILabel!
    @IBOutlet weak var registerOutlet: UIButton!

    var users = [User]()
    var animationPage: [CountryModel]?
    var jsonData = URL(string: "")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        underlineButton()
        animateSetup()
        uiSetup()
        greetingView()
        basicCornerAnimation()
        basicRotateAnimation()
       
        // auto filling textfields when opening login view
        emailTextField.text = "rustam@mail.com"
        passwordTextField.text = "12345"
        
        jsonData = getDocumentsDirectoryUrl().appendingPathComponent("Users.json")
    }
    
    // Underline Button first code
    fileprivate func underlineButton() {
        let attributeString = NSMutableAttributedString(
            string: "Not Registered",
            attributes: yourAttributes)
        registerOutlet.setAttributedTitle(attributeString, for: .normal)
    }
    
    // Underline Button second code
    let yourAttributes: [NSAttributedString.Key: Any] = [
        .font: UIFont.systemFont(ofSize: 18),
        .foregroundColor: UIColor.black,
        .underlineStyle: NSUnderlineStyle.single.rawValue ]
    
//    func tapGesture(){
//        let tap = UITapGestureRecognizer(target: self, action: #selector(LoginViewController.tapFunction))
//        self.dummyView.isUserInteractionEnabled = true
//        self.dummyView.addGestureRecognizer(tap)
//    }
    
    @objc func tapFunction(sender:UITapGestureRecognizer) {
        print("tap working")
    }
    
//    func transformAnimation(){
//        UIView.animate(withDuration: 2, delay: 0, options: [.autoreverse, .repeat]) {
//            self.dummyView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
//
//        }
//    }
    
    func basicCornerAnimation(){
        let animation = CABasicAnimation(keyPath: "cornerRadius")
        animation.fromValue = 0
        animation.toValue = 60
        animation.duration = 3
        animation.repeatCount = .infinity
        animation.autoreverses = true
        animationView.layer.add(animation, forKey: nil)
    }
    
    func basicRotateAnimation(){
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.fromValue = 0
        animation.toValue = CGFloat.pi * 2
        animation.duration = 3
        animation.repeatCount = .infinity
        animation.autoreverses = true
        animationView.layer.add(animation, forKey: nil)
    }
    
    fileprivate func greetingView() {
        animationView.backgroundColor = .clear
        animationLabel.text = ""
        
        UIView.animate(withDuration: 1, delay: 0) {
            self.animationView.layer.cornerRadius = 60
            
        } completion: { _ in
            UIView.animate(withDuration: 2, delay: 0, options: .curveEaseIn) {
                self.animationView.backgroundColor = .systemMint
                self.view.layoutIfNeeded()
                
            } completion: { _ in
                self.animationLabel.text = "Welcome..."
                self.view.layoutIfNeeded()
                
            }
            
        }
    }
    
    fileprivate func animateSetup() {
        emailTextField.center.x = self.view.frame.width + 300
        UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .allowAnimatedContent, animations: {
            self.emailTextField.center.x = self.view.frame.width / 2
        }, completion: nil)
        
        passwordTextField.center.x = self.view.frame.width - 700
        UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .allowAnimatedContent, animations: {
            self.passwordTextField.center.x = self.view.frame.width / 2
        }, completion: nil)
        
        buttonLabel.backgroundColor = .clear
        
        UIView.animate(withDuration: 1.0, delay: 0) {
            self.buttonLabel.backgroundColor = .systemIndigo
            self.view.layoutIfNeeded()
            
        }
        
    }
    
    fileprivate func uiSetup() {
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        emailTextField.layer.cornerRadius = 15
        passwordTextField.layer.cornerRadius = 15
        buttonLabel.layer.cornerRadius = 15
        emailTextField.layer.borderColor = UIColor.black.cgColor
        passwordTextField.layer.borderColor = UIColor.black.cgColor
        emailTextField.layer.borderWidth = 1
        passwordTextField.layer.borderWidth = 1
        
        // add padding in text field
        let leftViewEmail = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 10.0, height: 2.0))
        emailTextField.leftView = leftViewEmail
        emailTextField.leftViewMode = .always
        
        // add padding in text field
        let leftViewPass = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 10.0, height: 2.0))
        passwordTextField.leftView = leftViewPass
        passwordTextField.leftViewMode = .always
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func getDocumentsDirectoryUrl() -> URL{
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    
    func jsonCalled() {
        if let file = jsonData, let data = try? Data(contentsOf: file) {
            do {
                users = try JSONDecoder().decode([User].self, from: data)
            }
            catch {
                print(error.localizedDescription)
                print("error")
            }
        }
    }
    
    func checkUsers() -> Bool {
        var i = 0
        while i < users.count {
            if emailTextField.text == users[i].email && passwordTextField.text == users[i].password {
                return true
            }
            i += 1
        }
        return false
    }
    
    @IBAction func enterAction(_ sender: Any) {
        jsonCalled()
        if checkUsers() {
            let homeViewController = storyboard?.instantiateViewController(withIdentifier: "UINavigationController") as! UINavigationController
            self.view.window?.rootViewController = homeViewController
            self.view.window?.makeKeyAndVisible()
            
        } else{
            let alert = UIAlertController(title: "Alert", message: "Something went wrong", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .default))
            self.present(alert, animated: true, completion: nil)
            
        }

    }
    
    
    @IBAction func registerAction(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        show(controller, sender: nil)
    }
}

//
//  LoginViewController.swift
//  LectureProject_1
//
//  Created by Rustem Manafov on 02.07.22.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var buttonLabel: UIButton!
    @IBOutlet weak var emailLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var passwordTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var animationView: UIView!
    @IBOutlet weak var animationLabel: UILabel!
    @IBOutlet weak var dummyView: UILabel!
    @IBOutlet weak var registerOutlet: UIButton!
    
    
    var loginModel: [LoginModel]?
    var animationPage: [CountryModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        underlineButton()
        tapGesture()
        animateSetup()
        uiSetup()
        // greetingView()
        basicCornerAnimation()
        basicRotateAnimation()
        transformAnimation()
        
        // auto filling textfields when opening login view
        emailTextField.text = "admin@gmail.com"
        passwordTextField.text = "admin"
        
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
    
    
    func tapGesture(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(LoginViewController.tapFunction))
        self.dummyView.isUserInteractionEnabled = true
        self.dummyView.addGestureRecognizer(tap)
    }
    
    @objc func tapFunction(sender:UITapGestureRecognizer) {
        print("tap working")
    }
    
    func transformAnimation(){
        UIView.animate(withDuration: 2, delay: 0, options: [.autoreverse, .repeat]) {
            self.dummyView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        }
    }
    
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
            UIView.animate(withDuration: 3, delay: 0, options: .curveEaseIn) {
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
        UIView.animate(withDuration: 3.0, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .allowAnimatedContent, animations: {
            self.emailTextField.center.x = self.view.frame.width / 2
        }, completion: nil)
        
        passwordTextField.center.x = self.view.frame.width - 700
        UIView.animate(withDuration: 3.0, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .allowAnimatedContent, animations: {
            self.passwordTextField.center.x = self.view.frame.width / 2
        }, completion: nil)
        
        buttonLabel.backgroundColor = .clear
        
        UIView.animate(withDuration: 3, delay: 0) {
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
    
    func jsonCalled() {
        if let jsonData = Bundle.main.url(forResource: "Login", withExtension: "json"), let data = try? Data(contentsOf: jsonData) {
            do {
                loginModel = try JSONDecoder().decode([LoginModel].self, from: data)
                print("worked login controller")
                
                var i = 0
                while i < loginModel!.count {
                    if emailTextField.text == loginModel![i].email && passwordTextField.text == loginModel![i].password {
                        
                        let homeViewController = storyboard?.instantiateViewController(withIdentifier: "UINavigationController") as! UINavigationController
                        self.view.window?.rootViewController = homeViewController
                        self.view.window?.makeKeyAndVisible()
                        break
                    } else {
                        let alert = UIAlertController(title: "Alert", message: "Something went wrong", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Dismiss", style: .default))
                        self.present(alert, animated: true, completion: nil)
                    }
                    i += 1
                }
                
            } catch {
                print(error.localizedDescription)
                print("error")
                
            }
        }
    }
    
    @IBAction func enterAction(_ sender: Any) {
        jsonCalled()
    }
    
    @IBAction func registerAction(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        show(controller, sender: nil)
    }
}

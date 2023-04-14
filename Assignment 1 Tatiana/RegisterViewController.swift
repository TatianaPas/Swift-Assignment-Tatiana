//
//  RegisterViewController.swift
//  Assignment 1 Tatiana
//
//  Created by Tatiana Pasechnik on 13/04/23.
// 

import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate{
    
 //outlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var scrollView: UIScrollView!
    weak var activeField: UITextField?
   
    
    override func viewDidLoad() {

        super.viewDidLoad()

        //display password as dotts in ios12+
        passwordTextField.textContentType = .oneTimeCode
        
        //method to controll when Keyboard shows
        KeyboardNotificationUtils.registerKeyboardNotifications(for: self, didShow: #selector(keyboardDidShow), willHide: #selector(keyboardWillBeHidden))
    }
    deinit {
           NotificationCenter.default.removeObserver(self)
       }
    
    // Method to close Keyboard when user finished typing
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
        }
    
    // check if text field finished editing
    func textFieldDidEndEditing(_ textField: UITextField) {
            activeField = nil
        }
    
     // check if textfield is active
    func textFieldDidBeginEditing(_ textField: UITextField) {
            activeField = textField
        }
    
    //Manipulate keyboard to display under the field, where entering text
    @objc func keyboardDidShow(notification: Notification) {
        let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue
        guard let activeField = activeField, let keyboardHeight = keyboardSize?.height else { return }

        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardHeight, right: 0.0)
            scrollView.contentInset = contentInsets
            scrollView.scrollIndicatorInsets = contentInsets
        let activeRect = activeField.convert(activeField.bounds, to: scrollView)
            scrollView.scrollRectToVisible(activeRect, animated: true)
        }
        
    @objc func keyboardWillBeHidden(notification: Notification) {
            let contentInsets = UIEdgeInsets.zero
            scrollView.contentInset = contentInsets
            scrollView.scrollIndicatorInsets = contentInsets
        }

    
    // Register new user
    @IBAction func registerUserBtn(_ sender: UIButton) {
        
        let textFieldsArray = [nameTextField,addressTextField, emailTextField, phoneTextField, usernameTextField, passwordTextField]
        var emptyFieldsArray = [UITextField]()
        

        for field in textFieldsArray
        {
            if field!.text!.isEmpty
            {
                field!.layer.borderColor = UIColor.red.cgColor
                field!.layer.borderWidth = 1
                showMessage(msg: "Attention! Some required information is missing. Please make sure you fill in all the fields before proceeding", controller: self)
                emptyFieldsArray.append(field!)
            }
            else
            {
                field!.layer.borderWidth = 0
            }
        }
        
        if emptyFieldsArray.isEmpty
        {
            let uName = nameTextField.text!
            let uAddress = addressTextField.text!
            let uEmail = emailTextField.text!
            let uPhone = phoneTextField.text!
            let uUsername = usernameTextField.text!
            let uPassword = passwordTextField.text!
            
           if !(searchUser(username: uUsername))
            {
               let newUser = User(name: uName, address: uAddress, email: uEmail, phone: uPhone, usernmae: uUsername, password: uPassword)
               
               users.append(newUser)
               
               let data = try! NSKeyedArchiver.archivedData(withRootObject: users, requiringSecureCoding: false)
               UserDefaults.standard.set(data, forKey: "users")
               showMessage(msg: "User registered successfully", controller: self)
           }
            else
            {
                showMessage (msg: "This username already exist, please choose another username or login", controller: self)
            }
            
            
            
            
            
        }
    }
        
}

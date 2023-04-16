//
//  ViewController.swift
//  Assignment 1 Tatiana
//
//  Created by Tatiana Pasechnik on 13/04/23.
// code for hiding KeyBoard used form tutorial https://spin.atomicobject.com/2020/03/23/uiscrollview-content-layout-guides/

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    //Outlets
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    

    @IBAction func registerBtn(_ sender: UIButton) {
        
        performSegue(withIdentifier: "registerSegue", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    //Actions
    @IBAction func sigInButton(_ sender: Any) {
        
        // Retrieve the user's inputted username and password
          let username = usernameTextField.text ?? ""
          let password = passwordTextField.text ?? ""
          
          // Retrieve the array of users from UserDefaults
          let usersArray = readUserData()
          
          // Loop through the usersArray and check if any user has the same username and password
          var isValidCredentials = false
          for user in usersArray {
              if user.username == username && user.password == password {
                  isValidCredentials = true
                  break
              }
          }
          
          // Check if the user's credentials are valid and proceed with the login process
          if isValidCredentials {
              // The user's credentials are valid. Proceed with the login process.
              performSegue(withIdentifier: "loggedInSegue", sender: self)
          } else {
              // The user's credentials are invalid. Display an error message to the user.
              let alert = UIAlertController(title: "Login Failed", message: "The username or password you entered is incorrect. Please check your details and try again.", preferredStyle: .alert)
              alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
              present(alert, animated: true, completion: nil)
          }
      }

      override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
          if identifier == "loggedInSegue" {
              // Retrieve the user's inputted username and password
              let username = usernameTextField.text ?? ""
              let password = passwordTextField.text ?? ""
              
              // Retrieve the array of users from UserDefaults
              let usersArray = readUserData()
              
              // Loop through the usersArray and check if any user has the same username and password
              var isValidCredentials = false
              for user in usersArray {
                  if user.username == username && user.password == password {
                      isValidCredentials = true
                      break
                  }
              }
              
              // Check if the user's credentials are valid
              if !isValidCredentials {
                  // The user's credentials are invalid. Display an error message to the user.
                  let alert = UIAlertController(title: "Login Failed", message: "The username or password you entered is incorrect. Please check your details and try again.", preferredStyle: .alert)
                  alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                  present(alert, animated: true, completion: nil)
              }
              
              return isValidCredentials
          }
          
          return true
      }
    
  

}


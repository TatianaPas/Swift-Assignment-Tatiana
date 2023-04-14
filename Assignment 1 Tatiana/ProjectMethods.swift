//
//  ProjectMethods.swift
//  Assignment 1 Tatiana
//
//  Created by Tatiana Pasechnik on 13/04/23.
//

import UIKit
import Foundation

//listen to keyboard messages. Method used to hide keyboard if user stopped typing.
class KeyboardNotificationUtils{
    static func registerKeyboardNotifications(for observer: Any, didShow:Selector?, willHide: Selector?){
        NotificationCenter.default.addObserver(observer, selector: didShow!,
                   name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(observer, selector: willHide!,
                   name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}

var users = [User]()

// get all users
func readUserData() -> [User]
{
    let data = UserDefaults.standard.value(forKey: "users") as! Data
    let users = try!  NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as! [User]
    return users
}

//display pop up message and stay on the same view
func showMessage(msg:String, controller: UIViewController)

{
    let alert = UIAlertController(title: "", message: msg, preferredStyle: .alert);
    let action = UIAlertAction(title: "OK", style: .default)
    {
        action
        in
    }
    alert.addAction(action)
    controller.present(alert, animated: true, completion: nil)
}

func showMessageAndRedirect(msg:String, controller: UIViewController)

{
    let alert = UIAlertController(title: "", message: msg, preferredStyle: .alert);
    let action = UIAlertAction(title: "OK", style: .default)
    {
        action
        in
        controller.dismiss(animated: true, completion: nil)
    }
    alert.addAction(action)
    controller.present(alert, animated: true, completion: nil)
}

//search if user with this username already exists
func searchUser (username:String) ->Bool
{
    for us in users
    {
        if us.username == username{
            return true
        }
    }
    return false
}

//check if user is in database whie logging in
func loginValidation(username: String, password: String)-> Bool
{
    var users = readUserData()
    for us in users
    {
        if us.username == username && us.password == password
        {
            return true
        }
    }
    return false
}





//
//  KeyboardNotificationHandler.swift
//  Assignment 1 Tatiana
//
//  Created by Tatiana Pasechnik on 13/04/23.
//
import UIKit
import Foundation

weak var scrollView: UIScrollView!
weak var activeField: UITextField?

@objc protocol KeyboardObserverProtocol{
    func keyboardDidShow(notification: Notification)
    func keyboardWillBeHidden(notification: Notification)
}

  func keyboardDidShow(notification: Notification) {
    let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue
    guard let activeField = activeField, let keyboardHeight = keyboardSize?.height else { return }

    let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardHeight, right: 0.0)
    scrollView.contentInset = contentInsets
    scrollView.scrollIndicatorInsets = contentInsets
    let activeRect = activeField.convert(activeField.bounds, to: scrollView)
    scrollView.scrollRectToVisible(activeRect, animated: true)
}

 func keyboardWillBeHidden(notification: Notification) {
    let contentInsets = UIEdgeInsets.zero
    scrollView.contentInset = contentInsets
    scrollView.scrollIndicatorInsets = contentInsets
}

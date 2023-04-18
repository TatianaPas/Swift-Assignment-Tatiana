//
//  AddNewSiteViewController.swift
//  Assignment 1 Tatiana
//
//  Created by Tatiana Pasechnik on 17/04/23.
//

import UIKit

class AddNewSiteViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var addressTextField: UITextField!
    
    @IBOutlet weak var descriptionTextField: UITextView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var saveSiteButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
// hide image view while view loads, if image is empty
        imageView.isHidden = true

    }
  //take picture with phone camera
    @IBAction func takePhotoButton(_ sender: UIButton) {
        let picker = UIImagePickerController()
        picker.allowsEditing = false
        picker.sourceType = .camera
        picker.delegate = self
        present(picker, animated: true)
    }
    
    //upload picture from photo library
    @IBAction func choosePhotoFromLibraryButton(_ sender: UIButton) {
        let picker = UIImagePickerController()
        picker.allowsEditing = false
        picker.sourceType = .photoLibrary
        picker.delegate = self
        present(picker, animated: true)
    }
    
    //display picture in image view
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let selectedImage = info[.originalImage] as! UIImage
        imageView.image = selectedImage
        imageView.isHidden = false
        dismiss(animated: true)

    }
    
    
    @IBAction func saveSiteButton(_ sender: UIButton) {
        let siteName = nameTextField.text!
        let siteAddress = addressTextField.text!
        let description = descriptionTextField.text!
        let sitePicture = imageView.image
       
        let date = Date.now
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = .short
        
        
        let saveDate = dateFormatter.string(from: date)
        

        let newSite = Site(name: siteName, address: siteAddress, siteDescription: description, saveDate: saveDate, image: sitePicture!)
           
        
        var savedSites = getSites()
        savedSites.append(newSite)
           
           let data = try! NSKeyedArchiver.archivedData(withRootObject: savedSites, requiringSecureCoding: false)
           UserDefaults.standard.set(data, forKey: "savedSites")
           showMessage(msg: "New site saved successfully", controller: self)
        
        nameTextField.text?.removeAll()
        addressTextField.text?.removeAll()
        descriptionTextField.text.removeAll()
        imageView.isHidden = true
          
    }
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

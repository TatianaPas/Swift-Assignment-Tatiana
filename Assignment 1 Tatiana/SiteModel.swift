//
//  SiteModel.swift
//  Assignment 1 Tatiana
//
//  Created by Tatiana Pasechnik on 13/04/23.
//
import UIKit
import Foundation

class Site: NSObject, NSCoding
{
    //all fields are mandatory
    
    var id: String
    var name: String
    var address: String
    var siteDescription: String
    var saveDate: String
    var image: UIImage
 

    init(name:String,address:String,siteDescription:String,saveDate:String,image:UIImage) {
        self.id = UUID().uuidString
        self.name = name
        self.address = address
        self.siteDescription = siteDescription
        self.saveDate = saveDate
        self.image = image

    }
    
    func encode(with coder: NSCoder) {
        coder.encode(id, forKey: "id")
        coder.encode(name,forKey: "name")
        coder.encode(address,forKey: "address")
        coder.encode(siteDescription,forKey: "siteDescription")
        coder.encode(saveDate, forKey: "saveDate")
        coder.encode(image, forKey: "image")
  
    }
    
    required init?(coder: NSCoder) {
        self.id = coder.decodeObject(forKey: "id") as! String
        self.name = coder.decodeObject(forKey: "name") as! String
        self.address = coder.decodeObject(forKey: "address") as! String
        self.siteDescription = coder.decodeObject(forKey: "siteDescription") as! String
        self.saveDate = coder.decodeObject(forKey: "saveDate") as! String
        self.image = coder.decodeObject(forKey: "image") as! UIImage

    }
}

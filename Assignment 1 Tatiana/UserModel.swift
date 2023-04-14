//
//  UserModel.swift
//  Assignment 1 Tatiana
//
//  Created by Tatiana Pasechnik on 13/04/23.
//

import Foundation

class User: NSObject, NSCoding
{
    //all fields are mandatory
    
    var id: String
    var name: String
    var address: String
    var email: String
    var phone: String
    var username: String
    var password: String

    init(name:String,address:String,email:String,phone:String,usernmae:String,password:String ) {
        self.id = UUID().uuidString
        self.name = name
        self.address = address
        self.email = email
        self.phone = phone
        self.username = usernmae
        self.password = password
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(id, forKey: "id")
        coder.encode(name,forKey: "name")
        coder.encode(address, forKey: "address")
        coder.encode(email, forKey: "email")
        coder.encode(phone, forKey: "phone")
        coder.encode(username, forKey: "username")
        coder.encode(password, forKey: "password")
    }
    
    required init?(coder: NSCoder) {
        self.id = coder.decodeObject(forKey: "id") as! String
        self.name = coder.decodeObject(forKey: "name") as! String
        self.address = coder.decodeObject(forKey: "address") as! String
        self.email = coder.decodeObject(forKey: "email") as! String
        self.phone = coder.decodeObject(forKey: "phone") as! String
        self.username = coder.decodeObject(forKey: "username") as! String
        self.password = coder.decodeObject(forKey: "password") as! String

    }
}


//
//  loginData.swift
//  InventoryManagement
//
//  Created by Sujith on 23/08/22.
//

import UIKit
struct LoginData:Decodable {
    let id:Int
    let email:String
    let user_roles:[User_roles]
}
struct User_roles:Decodable{
    let roles:String
}

//
//  addEmployee.swift
//  InventoryManagement
//
//  Created by Sujith on 25/08/22.
//

import Foundation
struct DeviceDetail : Decodable {
//  let img : String?
//  let deviceId : String?
//  let deviceName : String?
//  let assign : String?
    let id: Int?
    let name: String?
    let deviceType: String?
    let os: String?
    let serviceTag: String
    let employee: Employee?

    enum CodingKeys: String, CodingKey {
      case id, name
      case deviceType = "device_type"
      case os
      case serviceTag = "service_tag"
      case employee
    }
  }

  enum DeviceType: String, Decodable {
    case bag = "Bag"
    case charger = "Charger"
    case laptop = "Laptop"
  }

  // MARK: - Employee
  struct Employee: Decodable {
    let id: Int
    let name, email: String
    let phoneNumber: Int
    let designation: String

    enum CodingKeys: String, CodingKey {
      case id, name, email
      case phoneNumber = "phone_number"
      case designation
    }
  }

  enum Name: String, Decodable{
    case apple = "Apple"
    case dell = "Dell"
    case lenovo = "Lenovo"
  }

  enum OS: String, Decodable {
    case name = "MAC"
    case ios = "IOS"
    case osWindows = "Windows"
    case windows = "windows"
  }

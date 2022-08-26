//
//  AddDeviceViewController.swift
//  InventoryManagement
//
//  Created by Manisha on 11/08/22.
//

import UIKit

class AddDeviceViewController: UIViewController {
    
    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var assignedTo: UITextField!
    @IBOutlet weak var OSTxt: UITextField!
    @IBOutlet weak var serviceTagTxt: UITextField!
    @IBOutlet weak var selectDevice: UIButton!
    
    @IBOutlet var deviceClicked: [UIButton]!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func addButttonAction(_ sender: Any) {
        addDevice()
//        self.setupPostMethod()
    }
    @IBAction func selectAction(_ sender: UIButton) {
        deviceClicked.forEach { (button) in
            UIView.animate(withDuration: 0.3,animations: {
                button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
                
            })
        }
        
    }
    
    @IBAction func laptopBtn(_ sender: UIButton) {
        selectDevice.setTitle("Laptop", for: .normal)
        deviceClicked.forEach { (button) in
            UIView.animate(withDuration: 0.3,animations: {
                button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
            })
        }
    }
    @IBAction func bagBtn(_ sender: UIButton) {
        selectDevice.setTitle("Bag", for: .normal)
        deviceClicked.forEach { (button) in
            UIView.animate(withDuration: 0.3,animations: {
                button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
            })
        }
    }
    @IBAction func ChargerBtn(_ sender: UIButton) {
        selectDevice.setTitle("Charger", for: .normal)
        deviceClicked.forEach { (button) in
            UIView.animate(withDuration: 0.3,animations: {
                button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
            })
        }
    }
    let deviceURL = "https://2f02-183-82-122-219.in.ngrok.io/devices"
           func addDevice() {
                  guard let deviceName = self.nameTxt.text else { return }
               guard let deviceType = selectDevice.currentTitle else { return }
                  guard let OS = self.OSTxt.text else { return }
                  guard let serviceTag = self.serviceTagTxt.text else { return }
      if let url = URL(string:deviceURL ){
        var urlRequest = URLRequest(url:url)
        urlRequest.httpMethod = "post"
        let employeedata = ["name":deviceName,"device_type":deviceType,"os":OS,"service_tag":serviceTag]
        do {
          let requestBody = try JSONSerialization.data(withJSONObject: employeedata, options: .prettyPrinted)

          urlRequest.httpBody = requestBody

          urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        }
        catch let error{
          print(error.localizedDescription)
        }

        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
          if data != nil && data?.count != 0 {
            let response = String(data: data!, encoding: .utf8)
            debugPrint(response!)
          }
        }
        .resume()
      }


    }
    
    
}
    
//    extension AddDeviceViewController{
//        func setupPostMethod(){
//            guard let deviceName = self.nameTxt.text else { return }
//            guard let assignedTo = self.assignedTo.text else { return }
//            guard let deviceType = self.deviceTypeTxt.text else { return }
//            guard let os = self.OSTxt.text else { return }
//            guard let serviceTag = self.deviceTypeTxt.text else { return }
//            if let url = URL(string:"https://290f-183-82-122-219.in.ngrok.io/devices"){
//                var request = URLRequest(url: url)
//                request.httpMethod = "POST"
//                let parameters: [String : String] = [
//                    "name": deviceName,
//                    "device_type": deviceType,
//                    "os": os,
//                    "service_tag":serviceTag,
////                    "employee_id":assignedTo
//
//                ]
//                request.httpBody = parameters.percentEscaped().data(using: .utf8)
//
//                URLSession.shared.dataTask(with: request) { (data, response, error) in
//                    guard let data = data else {
//                        if error == nil{
//                            print(error?.localizedDescription ?? "Unknown Error")
//                        }
//                        return
//                    }
//
//                    if let response = response as? HTTPURLResponse{
//                        guard (200 ... 299) ~= response.statusCode else {
//                            print("Status code :- \(response.statusCode)")
//                            print(response)
//                            return
//                        }
//                    }
//
//                    do{
//                        let json = try JSONSerialization.jsonObject(with: data, options: [])
//                        print(json)
//                    }catch let error{
//                        print(error.localizedDescription)
//                    }                }.resume()
//            }
//        }
//    }
//
//
//
//
//    extension Dictionary {
//        func percentEscaped() -> String {
//            return map { (key, value) in
//                let escapedKey = "\(key)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
//                let escapedValue = "\(value)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
//                return escapedKey + "=" + escapedValue
//            }
//            .joined(separator: "&")
//        }
//    }
//
//    extension CharacterSet {
//        static let urlQueryValueAllowed: CharacterSet = {
//            let generalDelimitersToEncode = ":#[]@" // does not include "?" or "/" due to RFC 3986 - Section 3.4
//            let subDelimitersToEncode = "!$&'()*+,;="
//
//            var allowed = CharacterSet.urlQueryAllowed
//            allowed.remove(charactersIn: "\(generalDelimitersToEncode)\(subDelimitersToEncode)")
//            return allowed
//        }()
//    }
//
//
//
//
//
//

//
//  AddEmployeeViewController.swift
//  InventoryManagement
//
//  Created by Manisha on 11/08/22.
//

import UIKit

class AddEmployeeViewController: UIViewController {
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtDesignation: UITextField!
    @IBOutlet weak var txtNumber: UITextField!
    @IBOutlet weak var txtEmpid: UITextField!
    
  
    @IBOutlet var roles: [UIButton]!
    
    @IBOutlet weak var btnRole: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.addEmployee() // Do any additional setup after loading the view.
    }
    

  
    @IBAction func selectRole(_ sender: UIButton) {
        roles.forEach { (button) in
            UIView.animate(withDuration: 0.3,animations: {
                button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
            })
        }
        
        
    }
    @IBAction func BtnAdmin(_ sender: UIButton) {
        btnRole.setTitle("Admin", for: .normal)
        roles.forEach { (button) in
            UIView.animate(withDuration: 0.3,animations: {
                button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
            })
        }
        
    }
    @IBAction func BtnEmployee(_ sender: UIButton) {
        btnRole.setTitle("Employee", for: .normal)
        roles.forEach { (button) in
            UIView.animate(withDuration: 0.3,animations: {
                button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
            })
        }
    }
    @IBAction func addButton(_ sender: UIButton) {
        self.addEmployee()
    }
    
    
    
    let employeeURL = "https://2f02-183-82-122-219.in.ngrok.io/employees"

      func addEmployee(){
                    guard let name = self.txtName.text else { return }
                    guard let email = self.txtEmail.text else { return }
                    guard let designation = self.txtDesignation.text else { return }
                    guard let phoneNumber = self.txtNumber.text else { return }
                    guard let Empid = self.txtEmpid.text else { return }
                    guard let Role = btnRole.currentTitle else { return }
        if let url = URL(string:employeeURL ){
          var urlRequest = URLRequest(url:url)
          urlRequest.httpMethod = "post"
          let employeedata = ["name":name,"email":email,"designation":designation,"phone_number":phoneNumber,"emp_id":Empid,"roles":Role]
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
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */



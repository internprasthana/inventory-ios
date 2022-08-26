//
//  EmployeeDetailsViewController.swift
//  InventoryManagement
//
//  Created by Manisha on 12/08/22.
//

import UIKit

class EmployeeDetailsViewController: UIViewController {

    @IBOutlet weak var EmpName: UILabel!
    @IBOutlet weak var empEmail: UILabel!
    @IBOutlet weak var empId: UILabel!
    @IBOutlet weak var empRole: UILabel!
    @IBOutlet weak var imageD: UIImageView!
    @IBOutlet weak var imageD2: UIImageView!
    @IBOutlet var viewframe: UIView!
    
   
    var emplyoyee:EmpDetails?
    var emailDetalis:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        viewframe.layer.cornerRadius = 10
        
        EmpName.text = emplyoyee?.name
//        empEmail.text = emplyoyee.email
        empId.text = emailDetalis
        empRole.text = emplyoyee?.role
        imageD.image = UIImage(named: emplyoyee?.img ?? "")
    }
    

   
    

}

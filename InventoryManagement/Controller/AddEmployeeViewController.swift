//
//  AddEmployeeViewController.swift
//  InventoryManagement
//
//  Created by Manisha on 11/08/22.
//

import UIKit

class AddEmployeeViewController: UIViewController {
    
    
  
    @IBOutlet var roles: [UIButton]!
    
    @IBOutlet weak var btnRole: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

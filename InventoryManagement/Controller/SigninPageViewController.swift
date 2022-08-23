

import UIKit

class SigninPageViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func signinbutton(_ sender: UIButton)  {
        if let email = emailTextField.text, let password = passwordTextField.text{
            if !email.validateEmailId() {
                openAlert(title: "Alert", message: "Enter valid email", alertStyle: .alert, actionTitles: ["okay"], actionStyles: [.default], actions: [{_ in
                    print("okay clicked")
                }])
                
            }else if !password.validatePassword() {
                do {
                    openAlert(title: "Alert", message: "Enter valid password", alertStyle: .alert, actionTitles: ["okay"], actionStyles: [.default], actions: [{_ in
                        print("okay clicked")
                    }])
                    
                }
            }else {
                performSegue(withIdentifier: "employeeList", sender:Self.self)
            }
            
        }
        else {
            do {
                openAlert(title: "Alert", message: "Enter valid details", alertStyle: .alert, actionTitles: ["okay"], actionStyles: [.default], actions: [{_ in
                    print("okay clicked")
                }])
                
            }
        }
    }
    @IBAction func forgotPasswordButton(_ sender: UIButton) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


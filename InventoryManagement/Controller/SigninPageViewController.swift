

import UIKit

class SigninPageViewController: UIViewController {
    
//    var loginPage = LoginPage()
          var Email:String = ""
          
    
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
                let loginURL = "https://2f02-183-82-122-219.in.ngrok.io"
                let urlString = "\(loginURL)/auth/login?email=\(email)&password=\(password)"
                performRequest(urlString:urlString)
                func performRequest(urlString:String){
                    if let url = URL(string: urlString) {
                        let session = URLSession(configuration: .default)
                        let task = session.dataTask(with: url) { data, response, error in
                            if error != nil {
                                print(error!)
                                return
                            }
                            if let safeData = data {
                                parseJSON(loginData:safeData)
                            }
                        }
                        task.resume()
                    }
                }
                func parseJSON(loginData:Data) {
                    let decoder = JSONDecoder()
                    do{
                        let decodedData = try decoder.decode(LoginData.self, from: loginData)
                        let role1 = decodedData.user_roles.count
                       Email = decodedData.email
                        
                        if role1 == 2 {
                            DispatchQueue.main.async {
                                self.performSegue(withIdentifier: "employeeList", sender:Self.self)
                            }}
                        else {
                            DispatchQueue.main.async {
                                self.performSegue(withIdentifier: "goToEmployeeD", sender:Self.self)
                            }
                        }
                    }catch {
                        print(error)
                    }
                }
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "employeeDetails" {
            let destinationVC = segue.destination as! EmployeeDetailsViewController
            destinationVC.emailDetalis = Email
            print(Email)
//            destinationVC.advice = calculatorBrain.getAdvice()
//            destinationVC.color = calculatorBrain.getColor()
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
   
}

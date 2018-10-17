//
//  RegistrationViewController.swift
//  Smart Inventory
//
//  Created by Patlolla,Shruthi on 10/5/18.
//  Copyright © 2018 Jennaikode,Vamshi Raj. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {

    @IBOutlet weak var firstNameTF: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    @IBOutlet weak var userIdTF: UITextField!
    @IBOutlet weak var emailIdTF: UITextField!
    @IBOutlet weak var dobTF: UITextField!
    @IBOutlet weak var addressTF: UITextField!
    @IBOutlet weak var cityTF: UITextField!
    @IBOutlet weak var stateTF: UITextField!
    @IBOutlet weak var zipTF: UITextField!
    @IBOutlet weak var mobileNumberTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var confirmPasswordTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func display(title:String, msg:String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { (action) -> Void in
            let view = self.storyboard?.instantiateViewController(withIdentifier: "loginvc")
            self.present(view!, animated: true, completion: nil)
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func onRegister(_ sender: Any) {
        
        let user = User(user_id: userIdTF.text! ,name: firstNameTF.text! + " " + lastNameTF.text!,
                        email:emailIdTF.text!, password: passwordTF.text!, mobile: Int(mobileNumberTF.text!)!,dob: dobTF.text!, address:Address(firstLine: addressTF.text! ,city: cityTF.text! , state: stateTF.text! , zip: Int(zipTF.text!)!))
        UsersRepo.users.addUser(user)
        display(title: "Success", msg: "Registered successfully" )
        
        
    }
    
    @IBAction func onCancel(_ sender: Any) {
        let view = self.storyboard?.instantiateViewController(withIdentifier: "loginvc")
        self.present(view!, animated: true, completion: nil)
    }
    
    
}

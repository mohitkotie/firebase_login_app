//
//  SignUpVC.swift
//  minionlogin
//
//  Created by mohit kotie on 19/11/17.
//  Copyright © 2017 mohit kotie mohit. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class SignUpVC: UIViewController {
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signupTapped(_ sender: Any) {
        // displayPopup(title: "TEST", message: "Test was success")
        
        if email.text == "" || password.text == ""{
            
            displayPopup(title:" Missing INFO", message: "No Fields Can Be Empty")
        }else{
            // create user
            
            Auth.auth().createUser(withEmail: email.text!, password: password.text!, completion: { (user, error) in
                if error != nil{
                    
                    if let myerror = error?.localizedDescription{
                        self.displayPopup(title: "Error", message: myerror)
                        
                    }
                }else{
                    
                Database.database().reference().child("users").child(user!.uid).setValue(self.email.text!)
                    self.displayPopup(title:"SUCCESS", message: "Now you can login")
                }
            })
        }
    }
    
    
    @IBAction func loginTapped(_ sender: Any) {
        
        let Storyboard = UIStoryboard(name: "Main", bundle: nil)
        let hcv = Storyboard.instantiateViewController(withIdentifier: "LoginScreen")
        if navigationController == nil{
            present(hcv, animated: true, completion: nil)
        }else{
            self.navigationController?.pushViewController(hcv, animated: true)
            
        }
    }
    
    func displayPopup(title :String,message :String){
        let alertcontroller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertcontroller.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertcontroller, animated: true, completion: nil)
        
}
}

//
//  ViewController.swift
//  minionlogin
//
//  Created by mohit kotie on 19/11/17.
//  Copyright © 2017 mohit kotie mohit. All rights reserved.
//

import UIKit
import Firebase

class LoginVC: UIViewController {
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @IBAction func loginTapped(_ sender: Any) {
        
        if email.text == "" || password.text == ""{
            
            displayPopup(title:" Missing INFO", message: "No Fields Can Be Empty")
        }else{
            // sign in
            Auth.auth().signIn(withEmail: email.text!, password: password.text!, completion: { (user, error) in
            
                if error != nil{
                    if let myerror = error?.localizedDescription{
                        self.displayPopup(title: "ERROR", message: myerror)
                    }
                }else{
                    // perform login
                    print("########################")
                 //   print(user ?? <#default value#>)
                  self.performSegue(withIdentifier:"cell", sender: nil)
                }
                
            })
        }
    }
    func displayPopup(title :String,message :String){
        let alertcontroller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertcontroller.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertcontroller, animated: true, completion: nil)
        
    }

}


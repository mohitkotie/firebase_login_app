//
//  SuccessVC.swift
//  minionlogin
//
//  Created by mohit kotie on 19/11/17.
//  Copyright © 2017 mohit kotie mohit. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase


class SuccessVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func logoutTapped(_ sender: Any) {
        
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            displayPopup(title: "SUCCESS", message: "LOGOUT SUCCESSFULLY")
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
            displayPopup(title: "ERROR", message: String(describing: signOutError))
        }
    }
    func pop(alert: UIAlertAction!){
        
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
                alertcontroller.addAction(UIAlertAction(title: "OK", style: .default, handler:pop))

        present(alertcontroller, animated: true,completion: nil)
        
        }


}

//
//  ViewController.swift
//  Cupcake
//
//  Created by Soham Shah on 12/6/16.
//  Copyright © 2016 Soham Shah. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet var usernameTextField: UITextField!
    
    @IBOutlet var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signinTapped(_ sender: Any) {
        let username = usernameTextField.text
        let password = passwordTextField.text
        
        FIRAuth.auth()?.signIn(withEmail: username!, password: password!, completion: { (user, error) in
            if error != nil {
                //was an error logging in
                let alert = UIAlertController(title: "Error", message: "Incorrect username/password", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
            } else {
                // success
                let alert = UIAlertController(title: "Success", message: "You're logged in!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)


            }
        })
    }
    


}


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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        //check if user signed in
        //if FIRAuth.auth()?.currentUser != nil {
            //user already logged in
          //  let vc = self.storyboard?.instantiateViewController(withIdentifier: "PostVC")
           // self.present(vc!, animated: true, completion: nil)
        //}
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
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "PostVC")
                self.present(vc!, animated: true, completion: nil)


            }
        })
    }
    


}


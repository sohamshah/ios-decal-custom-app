//
//  RegisterViewController.swift
//  Cupcake
//
//  Created by Soham Shah on 12/6/16.
//  Copyright © 2016 Soham Shah. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class RegisterViewController: UIViewController {

    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var usernameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func createAccountTapped(_ sender: Any) {
        let username = usernameTextField.text
        let password = passwordTextField.text
        
        FIRAuth.auth()?.createUser(withEmail: username!, password: password!, completion: { (user, error) in
            if error != nil {
                //was an error logging in
                let errorMessage = error?.localizedDescription
                let alert = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
            } else {
                // success
                
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "PostVC")
                self.present(vc!, animated: true, completion: nil)
                
            }
        })
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  PostViewController.swift
//  Cupcake
//
//  Created by Soham Shah on 12/6/16.
//  Copyright © 2016 Soham Shah. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class PostViewController: UIViewController {
    @IBOutlet var titleTextField: UITextField!

    @IBOutlet var contentTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func postTapped(_ sender: Any) {
        let uid = FIRAuth.auth()?.currentUser?.uid
        let title = titleTextField.text
        let content = contentTextView.text
        
        let postObject = [
            "uid" : uid,
            "title" : title,
            "content" : content
        ]
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

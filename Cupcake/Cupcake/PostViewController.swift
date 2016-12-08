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
import FirebaseDatabase
import FirebaseStorage


class PostViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet var titleTextField: UITextField!

    @IBOutlet var previewImageView: UIImageView!
    @IBOutlet var contentTextView: UITextView!
    @IBOutlet var selectImageButton: UIButton!
    
    var imageFileName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        //runs when user clicks cancel
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        //runs when user finishes picking image from library
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.previewImageView.image = pickedImage
            self.selectImageButton.isEnabled = false
            self.selectImageButton.isHidden = true
            uploadImage(image: pickedImage)
            picker.dismiss(animated: true, completion: nil)
        }
        
    }
    
    
    @IBAction func selectImageTapped(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        self.present(picker, animated: true, completion: nil)
    }
    
    func uploadImage(image: UIImage) {
        let randomName = randomStringWithLength(length: 10)
        let imageData = UIImageJPEGRepresentation(image, 1.0)
        let uploadRef = FIRStorage.storage().reference().child("images/\(randomName).jpg")
        let uploadTask = uploadRef.put(imageData!, metadata: nil) { metadata,
            error in
            if error == nil {
                //success
                print("Successfully uploaded image")
                self.imageFileName = "\(randomName as String).jpg"
            } else {
                print("Error uploading image: \(error?.localizedDescription)")
            }
        }
    }
    
    func randomStringWithLength(length: Int) -> NSString {
        let characters: NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUBWXYZ0123456789"
        let randomString: NSMutableString = NSMutableString(capacity: length)
        
        for i in 0..<length {
            var len = UInt32(characters.length)
            var rand = arc4random_uniform(len)
            randomString.appendFormat("%C", characters.character(at: Int(rand)))
        }
        return randomString
    }
    
    @IBAction func postTapped(_ sender: Any) {
        if let uid = FIRAuth.auth()?.currentUser?.uid {
            if let title = titleTextField.text {
                if let content = contentTextView.text {
                    let postObject: Dictionary<String, Any> = [
                        "uid" : uid,
                        "title" : title,
                        "content" : content,
                        "image" : imageFileName
                    ]
                    FIRDatabase.database().reference().child("posts").childByAutoId().setValue(postObject)
                    
                    let alert = UIAlertController(title: "Success", message: "Your recipe has been posted!", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    
                    print("Posted to Firebase.")
                }
            }
        }
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

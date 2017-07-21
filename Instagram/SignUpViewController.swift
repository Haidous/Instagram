//
//  SignUpViewController.swift
//  Instagram
//
//  Created by Moussa Haidous on 7/19/17.
//  Copyright © 2017 Moussa Haidous. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {

	@IBOutlet var profileImageView: RoundImageView!
	
	@IBOutlet var usernameTextField: RoundTextField!
	
	@IBOutlet var emailTextField: RoundTextField!
	@IBOutlet var passwordTextField: RoundTextField!
	
	let imagePicker = UIImagePickerController()
	
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
		
		imagePicker.delegate = self
		
    }

	@IBAction func cancelClicked(_ sender: Any) {
		
		dismiss(animated: true, completion: nil)
	}
	
	@IBAction func joinClicked(_ sender: Any) {
		
		if checkFields(){
		
			AuthService.instance.signin(email: emailTextField.text!, password: passwordTextField.text!, onComplete: {(error, data) in
				
				let user = data as! User
				let userID = user.uid
				
				DataService.instance.saveUser(uid: user.uid, username: self.usernameTextField.text!);
				DataService.instance.uploadPicture(imageView: self.profileImageView, uid: userID)
				
			})

		
		}else{
		
			print("HAIDOUS: Failure!")
		
		}
		
	}
	
	@IBAction func imageTapped(_ sender: Any) {
		
		print("HAIDOUS: Success!")
		
		imagePicker.allowsEditing = true
		imagePicker.sourceType = .photoLibrary
		
		present(imagePicker, animated: true, completion: nil)
	}
	
	@IBAction func viewTapped(_ sender: Any) {
		
		
		usernameTextField.resignFirstResponder()
		emailTextField.resignFirstResponder()
		passwordTextField.resignFirstResponder()
		
	}
	
	func checkFields() -> Bool{
	
		if usernameTextField.text == "" || emailTextField.text == "" || passwordTextField.text == nil{
		
			let alert = UIAlertController(title: "All Fields Are Required.", message: "Please fill all the fields.", preferredStyle: .alert)
			alert.addAction(UIAlertAction(title: "Okay!", style: .cancel, handler: nil))
			
			present(alert, animated: true, completion: nil)
			
			return false
		
		}else{
		
			return true
		
		}
	
	}
}

extension SignUpViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{

	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
		
		if let pickedImage = info[UIImagePickerControllerEditedImage] as? UIImage {
			profileImageView.contentMode = .scaleAspectFit
			profileImageView.image = pickedImage
		}
		
		dismiss(animated: true, completion: nil)
		
	}

}

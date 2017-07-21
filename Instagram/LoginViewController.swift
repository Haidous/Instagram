//
//  LoginViewController.swift
//  Instagram
//
//  Created by Moussa Haidous on 7/19/17.
//  Copyright © 2017 Moussa Haidous. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
	
	

	@IBOutlet var emailTextField: RoundTextField!
	@IBOutlet var passwordTextField: RoundTextField!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		// Do any additional setup after loading the view.
		
    }
	
	
	@IBAction func loginClicked(_ sender: Any) {
		
		if checkfields(){
		
			AuthService.instance.signin(email: emailTextField.text!, password: passwordTextField.text!, onComplete: {(error, data) in
			
				print("HAIDOUS: Success!")
				self.performSegue(withIdentifier: "toFeed1", sender: nil)
			
			})
		
		}else{
		
			print("HAIDOUS: Failure!")
		
		}
		
	}
	@IBAction func cancelClicked(_ sender: Any) {
		
		dismiss(animated: true, completion: nil)
	}

	@IBAction func viewTapped(_ sender: Any) {
		
		emailTextField.resignFirstResponder()
		passwordTextField.resignFirstResponder()
		
	}
	
	func checkfields() -> Bool{
		
		if emailTextField.text == "" || passwordTextField.text == ""{
		
			let alert = UIAlertController(title: "All Fields Are Required.", message: "Please fill all the fields.", preferredStyle: .alert)
			alert.addAction(UIAlertAction(title: "Okay!", style: .cancel, handler: nil))
			
			present(alert, animated: true, completion: nil)
			
			return false
		
		}else{
		
			return true
		
		}
	
	}
}

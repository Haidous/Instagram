//
//  AuthService.swift
//  SnapChat
//
//  Created by Moussa Haidous on 7/15/17.
//  Copyright © 2017 Moussa Haidous. All rights reserved.
//

import Foundation
import FirebaseAuth

typealias Completion = (_ errorMessage: String?, _ data: Any?) -> Void

class AuthService{

	private static let _instance = AuthService()
	
	static var instance:AuthService{
	
		return _instance
		
	}
	
	func signin(email: String, password: String, onComplete: Completion?){
	
		Auth.auth().signIn(withEmail: email, password: password, completion: {(user, error) in
			
			if error != nil{
			
				if let errorCode = AuthErrorCode(rawValue: (error! as NSError).code){
				
					if errorCode == .userNotFound{
					
						Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
						
							if error != nil{
							
								self.handleFirebaseError(error: error! as NSError, onComplete: onComplete)
								
							}else{
							
								if user?.uid != nil{
								
									DataService.instance.saveUser(uid: user!.uid)
									Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
										
										if error != nil{
										
											self.handleFirebaseError(error: error! as NSError, onComplete: onComplete)
											
										}else{
										
											onComplete!(nil, user)
										
										}
										
									})
									
								}
								
							}
		
						})
						
					}
					
				}else{
				
					self.handleFirebaseError(error: error! as NSError, onComplete: onComplete)
				
				}
			
			}else{
			
				onComplete!(nil, user)
			
			}
			
		})
		
	}
	
	func handleFirebaseError(error: NSError, onComplete: Completion?){
	
		if let errorCode = AuthErrorCode(rawValue: error.code){
			
			switch errorCode {
			case .invalidEmail:
				
				onComplete?("Invalid email address", nil)
				break
				
			case .wrongPassword:
				
				onComplete?("Wrong password", nil)
				break
			
			case .emailAlreadyInUse,.accountExistsWithDifferentCredential:
				
				onComplete?("Could not create account. Email already in use.", nil)
				break
				
			default:
				
				onComplete?("There was a problem. Please try again", nil)
				break
				
			}
		
		}
		
	}
	
}

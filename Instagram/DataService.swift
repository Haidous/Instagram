//
//  DataService.swift
//  SnapChat
//
//  Created by Moussa Haidous on 7/15/17.
//  Copyright © 2017 Moussa Haidous. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseStorage

class DataService{

	private static let _instance = DataService()
	
	static var instance:DataService{
	
		return _instance
		
	}
	
	var mainRef:DatabaseReference{
	
		return Database.database().reference()
	
	}
	
	var usersRef:DatabaseReference{
		
		return mainRef.child("users")
		
	}
	
	var mainStorageRef:StorageReference{
	
		return Storage.storage().reference()
		
	}
	
	var imageStorageRef:StorageReference{
	
		return mainStorageRef.child("images")
	
	}
	
	var videoStorageRef:StorageReference{
	
		return mainStorageRef.child("videos")
	
	}
	
	func saveUser(uid: String){
	
		let profile:Dictionary<String, Any> = ["username": ""]
		mainRef.child("users").child(uid).child("profile").setValue(profile)
	
	}
	
	func sendMedia(senderUID: String, sendingTo: Dictionary<String, User>, mediaURL: URL, textSnippet: String? = nil){
		
		var recipients = [String]()
		
		for key in sendingTo.keys{
		
			recipients.append(key)
			
		}
	
		let	sentMedia: Dictionary<String, Any> = ["mediaURL":mediaURL.absoluteString, "userID": senderUID, "openCount":0, "recipients":recipients]
		mainRef.child("sentMessages").childByAutoId().setValue(sentMedia)
		
	
	}

}

//
//  DataService.swift
//  SnapChat
//
//  Created by Moussa Haidous on 7/15/17.
//  Copyright © 2017 Moussa Haidous. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseStorage

class DataService{

	private static let _instance = DataService()
	
	var users = [_User]()
	
	static var instance:DataService{
	
		return _instance
		
	}
	
	var mainRef:DatabaseReference{
	
		return Database.database().reference()
	
	}
	
	var usersRef:DatabaseReference{
		
		return mainRef.child("users")
		
	}
	
	var postsRef:DatabaseReference{
	
		return mainRef.child("posts")
	
	}
	
	var mainStorageRef:StorageReference{
	
		return Storage.storage().reference()
		
	}
	
	var profileImagesStorageRef:StorageReference{
	
		return mainStorageRef.child("profile-pictures")
	
	}
	
	var postsImagesStorageRef:StorageReference{
	
		return mainStorageRef.child("posts-pictures")
	
	}
	
	var videoStorageRef:StorageReference{
	
		return mainStorageRef.child("videos")
	
	}
	
	func saveUser(uid: String, username: String){
	
		let profile:Dictionary<String, Any> = ["username": username]
		mainRef.child("users").child(uid).child("profile").setValue(profile)
	
	}

	func downloadPosts(onComplete: Completion?){
	
		var posts = [Post]()
		
		postsRef.observe(.value, with: { (snapshot) in
			
			let firstDict = snapshot.value! as? [String: Any]
			let idArray = Array(firstDict!.keys)
			let postsArray = Array(firstDict!.values)
			
			for (_post, _id) in zip(postsArray, idArray){
			
				let post = _post as! [String: Any]
				let id = _id 
				
				let caption = post["caption"] as! String
				let likes = post["likes"] as! String
				let postImageURL = post["postImage"] as! String
				let time = post["timeStamp"] as! String
				
				let actualPost = Post(uid: id, caption: caption, imageURL: postImageURL, likes: likes, time: time)
				
				posts.append(actualPost)
				
			
			}
			
			onComplete!(nil, posts)
			
		})

	}
	
	func downloadProfile(postID: String, onComplete: Completion?){
		
		usersRef.observe(.value, with: { (snapshot) in
			
			let firstDict = snapshot.value! as? [String: Any]
			let idArray = Array(firstDict!.keys)
			let usersArray = Array(firstDict!.values)
			
			for (_user, _id) in zip(usersArray, idArray){
				
				let user = _user as! [String: Any]
				let id = _id
				
				for _postID in Array((user["posts"] as! [String:Any]).keys){
				
					if _postID == postID{
						
						let userProfile = user["profile"] as! [String:Any]
						
						let username = userProfile["username"] as! String
						let profileImageURL = userProfile["profilePicture"] as! String
					
						let actualUser = _User(uid: id, username: username, profileImageURL: profileImageURL)
						
						self.users.append(actualUser)
						onComplete!(nil, self.users)

					
					}
				
				}
	
			}
			
		})
	
	}
	
	func uploadPicture(imageView: UIImageView, uid: String){
	
		if let image = imageView.image{
		
			let data = UIImagePNGRepresentation(image)!
			
			let randomID = UUID().uuidString
		
			profileImagesStorageRef.child(randomID).putData(data, metadata: nil) { (metadata, error) in
			guard let metadata = metadata else {
			
			return
			}
			
				let downloadURL = metadata.downloadURL()?.absoluteString
				self.mainRef.child("users").child(uid).child("profile").child("profilePicture").setValue(downloadURL)
				
			}
			
		}
	
	}
}

//
//  FeedViewController.swift
//  Instagram
//
//  Created by Moussa Haidous on 7/21/17.
//  Copyright © 2017 Moussa Haidous. All rights reserved.
//

import UIKit
import Firebase
import Kingfisher

class FeedViewController: UIViewController {

	@IBOutlet var tableView: UITableView!
	
	var posts = [Post]()
	var users = [_User]()
	
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
		tableView.delegate = self
		tableView.dataSource = self
		
		DataService.instance.downloadPosts(onComplete: {(error, posts) in

			self.posts = posts as! [Post]
	
			for post in posts as! [Post] {

				let postID = post.uid

				DataService.instance.downloadProfile(postID: postID, onComplete: {(error, users) in

					self.users = users as! [_User]
					self.tableView.reloadData()

				})
				
			}
			
			
		})
		
    }
	
	override func viewDidAppear(_ animated: Bool) {
		
		if Auth.auth().currentUser != nil {
			
		}else{
			
			performSegue(withIdentifier: "toLogin", sender: nil)
			
		}
		
//		
//		do {
//			try Auth.auth().signOut()
//		} catch let signOutError as NSError {
//			print ("Error signing out: %@", signOutError)
//		}
//
		
	}
	
	@IBAction func homeClicked(_ sender: Any) {
		
		
	}
	
	@IBAction func searchClicked(_ sender: Any) {
		
		
	}
	
	@IBAction func postClicked(_ sender: Any) {
		
		
	}
	
	@IBAction func activityClicked(_ sender: Any) {
		
		
	}
	
	@IBAction func settingsClicked(_ sender: Any) {
		
		
	}

}

extension FeedViewController: UITableViewDelegate, UITableViewDataSource{

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCell(withIdentifier: "postCell") as! PostCell
		
		
		if posts.isEmpty || users.isEmpty{
		
		
		}else{
			
			let post = posts[indexPath.row]
			
			let actualUser = users[indexPath.row]
				
			let url = URL(string: post.imageURL)
			let profileImageURL = URL(string: actualUser.profileImageURL)
		
			cell.usernameLabel.text = actualUser.username
			cell.timeLabel.text = post.time
		
			cell.postImageView.kf.setImage(with: url)
			cell.profileImageView.kf.setImage(with: profileImageURL)
			
			
			return cell
		}
		
		return cell
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
		return 2
	}
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}

}

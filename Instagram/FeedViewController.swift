//
//  FeedViewController.swift
//  Instagram
//
//  Created by Moussa Haidous on 7/21/17.
//  Copyright © 2017 Moussa Haidous. All rights reserved.
//

import UIKit
import Firebase

class FeedViewController: UIViewController {

	@IBOutlet var tableView: UITableView!
	
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
		tableView.delegate = self
		tableView.dataSource = self
		
    }
	
	override func viewDidAppear(_ animated: Bool) {
		if Auth.auth().currentUser != nil {
			
			print("HAIDOUS: NOOOO")
			
		}else{
			
			performSegue(withIdentifier: "toLogin", sender: nil)
			
		}
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
		
		let cell = tableView.dequeueReusableCell(withIdentifier: "postCell")! as UITableViewCell
		
		return cell
		
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
		return 2
	}
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}

}

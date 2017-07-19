//
//  ViewController.swift
//  Instagram
//
//  Created by Moussa Haidous on 7/19/17.
//  Copyright © 2017 Moussa Haidous. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

	@IBOutlet var collectionView: UICollectionView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		collectionView.delegate = self
		collectionView.dataSource = self
		
	}

}

extension LoginViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "featuredCell", for: indexPath) as! FeaturedCell
		
		
		
		return cell
	
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		
		
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		
		return 10
	}
	
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		
		return 1
	}


}


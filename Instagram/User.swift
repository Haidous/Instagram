//
//  User.swift
//  SnapChat
//
//  Created by Moussa Haidous on 7/15/17.
//  Copyright © 2017 Moussa Haidous. All rights reserved.
//

import Foundation

struct _User{

	private var _uid:String
	
	private var _username:String
	private var _profileImageURL:String
	
	var uid:String{
	
		return _uid
	
	}
	
	var username:String{
	
		return _username
		
	}
	
	var profileImageURL:String{
	
		return _profileImageURL
	
	}
	
	init(uid:String, username:String, profileImageURL:String){
	
		_uid = uid
		
		_username = username
		_profileImageURL = profileImageURL
	
	}

}

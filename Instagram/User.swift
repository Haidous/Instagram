//
//  User.swift
//  SnapChat
//
//  Created by Moussa Haidous on 7/15/17.
//  Copyright © 2017 Moussa Haidous. All rights reserved.
//

import Foundation

struct INSTAUser{

	private var _username:String
	private var _uid:String
	
	var uid: String{
	
		return _uid
	
	}
	
	var username: String{
	
		return _username
		
	}
	
	init(uid: String, username:String){
	
		_uid = uid
		_username = username
	
	}

}

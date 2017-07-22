//
//  Post.swift
//  Instagram
//
//  Created by Moussa Haidous on 7/21/17.
//  Copyright © 2017 Moussa Haidous. All rights reserved.
//

import UIKit

struct Post{
	
	private var _uid:String

	private var _caption:String
	private var _imageURL:String
	
	private var _likes:String
	private var _time:String
	
	
	var uid:String{
		
		return _uid
		
	}
	
	var caption:String{
	
		return _caption
	
	}
	
	var imageURL:String{
	
		return _imageURL
	
	}
	
	var likes:String{
	
		return _likes
	
	}
	
	var time:String{
	
		return _time
	
	}
	
	init(uid: String, caption:String, imageURL:String, likes:String, time:String){
		
		_uid = uid
		
		_caption = caption
		_imageURL = imageURL
		
		_likes = likes
		_time = time
		
	}

}

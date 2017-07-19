//
//  RoundImageView.swift
//  Instagram
//
//  Created by Moussa Haidous on 7/19/17.
//  Copyright © 2017 Moussa Haidous. All rights reserved.
//

import UIKit

@IBDesignable
class RoundImageView: UIImageView{
	
	@IBInspectable var cornerRadius: CGFloat = 0{
		
		didSet{
			
			layer.cornerRadius = cornerRadius
			layer.masksToBounds = cornerRadius > 0
			
		}
		
	}
	
	@IBInspectable var borderWidth: CGFloat = 0{
		
		didSet{
			
			layer.borderWidth = borderWidth
			
		}
		
	}
	
	@IBInspectable var borderColor: UIColor?{
		
		didSet{
			
			layer.borderColor = borderColor?.cgColor
			
		}
		
	}
	
	@IBInspectable var _backgroundColor: UIColor?{
		
		didSet{
			
			backgroundColor = _backgroundColor
			
		}
		
	}
	
}

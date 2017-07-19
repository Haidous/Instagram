//
//  RoundTextField.swift
//  SnapChat
//
//  Created by Moussa Haidous on 7/15/17.
//  Copyright © 2017 Moussa Haidous. All rights reserved.
//

import UIKit

@IBDesignable
class RoundTextField: UITextField{

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
	
	@IBInspectable var placeholderColor: UIColor?{
		
		didSet{
			
			let rawString = attributedPlaceholder != nil ? attributedPlaceholder!.string : ""
			let str = NSAttributedString(string: rawString, attributes: [NSForegroundColorAttributeName: placeholderColor!])
			attributedPlaceholder = str
			
		}
		
	}

}

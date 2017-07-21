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
	
	@IBInspectable var shadowRadius: CGFloat {
		get {
			return layer.shadowRadius
		}
		set {
			layer.shadowRadius = newValue
		}
	}
	
	@IBInspectable var shadowOpacity: Float {
		get {
			return layer.shadowOpacity
		}
		set {
			layer.shadowOpacity = newValue
		}
	}
	
	@IBInspectable var shadowOffset: CGSize {
		get {
			return layer.shadowOffset
		}
		set {
			layer.shadowOffset = newValue
		}
	}
	
	@IBInspectable var shadowColor: UIColor? {
		get {
			if let color = layer.shadowColor {
				return UIColor(cgColor: color)
			}
			return nil
		}
		set {
			if let color = newValue {
				layer.shadowColor = color.cgColor
			} else {
				layer.shadowColor = nil
			}
		}
	}
}

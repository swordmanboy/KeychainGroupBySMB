//
//  SMBUITextfield.swift
//  CustomNormalViewForSwift3_0
//
//  Created by Apinun Wongintawang on 8/31/17.
//  Copyright © 2017 Apinun Wongintawang. All rights reserved.
//

import UIKit

@IBDesignable
class SMBUITextfield : UITextField{
    
    //padding left right
    @IBInspectable var paddingLeft: CGFloat = 0
    @IBInspectable var paddingRight: CGFloat = 0
    
    //cornor radius
    @IBInspectable var cornorRadius : CGFloat = 0.0 {
        didSet{
            self.layer.cornerRadius = cornorRadius
        }
    }
    
    //width border
    @IBInspectable var borderWidth : CGFloat = 0.0 {
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }
    
    //color of Boder
    @IBInspectable var colorBorder : UIColor = UIColor.clear {
        didSet{
            self.layer.borderColor = colorBorder.cgColor
        }
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect.init(x: bounds.origin.x  + paddingLeft, y: bounds.origin.y, width: bounds.size.width - ((paddingLeft + paddingRight) / 2), height: bounds.size.height)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return self.textRect(forBounds:bounds)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return self.textRect(forBounds:bounds)
    }
}

//
//  SMBUIButton.swift
//  CustomNormalViewForSwift3_0
//
//  Created by Apinun Wongintawang on 8/31/17.
//  Copyright © 2017 Apinun Wongintawang. All rights reserved.
//

import UIKit

@IBDesignable
class SMBUIButton : UIButton{
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
    
}

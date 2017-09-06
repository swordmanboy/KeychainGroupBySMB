//
//  SMBUITextView.swift
//  KeychainSampleMain
//
//  Created by Apinun Wongintawang on 9/1/17.
//  Copyright © 2017 True. All rights reserved.
//

import UIKit
class SMBUITextView : UITextView{
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

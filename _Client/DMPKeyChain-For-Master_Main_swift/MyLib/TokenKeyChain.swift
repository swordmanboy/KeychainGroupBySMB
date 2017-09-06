//
//  TokenAppByKeyChain.swift
//  DMPKeyChain-For-Master_Main_swift
//
//  Created by Apinun Wongintawang on 9/6/17.
//  Copyright © 2017 True. All rights reserved.
//

import Foundation

class TokenKeyChain : NSObject{
    //variable
    var serviceKey : String! = ""
    var valueKey : String! = "KEY_TOKEN"
    var keychain : UICKeyChainStore! = nil
    
    static let shareInstance = TokenKeyChain()
    private override init() {} //This prevents others from using the default '()' initializer for this class.
}

extension TokenKeyChain{
    ///MARK : Public function
    public func initializeWithService(serviceKey:String, valueKey:String, keychain:String){
        TokenKeyChain.shareInstance.serviceKey = serviceKey
        TokenKeyChain.shareInstance.valueKey = valueKey
        TokenKeyChain.shareInstance.keychain = UICKeyChainStore.init(service: serviceKey)
    }
    
    public func getStringToken()->String{
        if let token = TokenKeyChain.shareInstance.keychain.string(forKey: TokenKeyChain.shareInstance.valueKey){
            return token
        }
        
        return ""
    }
    
    public func saveStringToken(token:String){
        TokenKeyChain.shareInstance.keychain.setString(token, forKey: self.valueKey)
    }
    
}

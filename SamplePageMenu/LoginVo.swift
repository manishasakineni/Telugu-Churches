//
//  LoginVo.swift
//  Telugu Churches
//
//  Created by Mac OS on 31/01/18.
//  Copyright © 2018 Mac OS. All rights reserved.
//

import Foundation

class LoginVo: Mappable {
    
    //MARK:-  Declaration of VideosVO
    
    
    var UserName : String?
    var Password : String?
    
    
    //MARK:-  initialization of VideosVO
    
    
    init(UserName : String?,Password : String?) {
        
        self.UserName = UserName
        self.Password = Password
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        UserName <- map["UserName"]
        Password <- map["Password"]
        
    }
    
    
}

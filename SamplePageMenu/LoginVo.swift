//
//  LoginVo.swift
//  Telugu Churches
//
//  Created by Mac OS on 31/01/18.
//  Copyright © 2018 Mac OS. All rights reserved.
//

import Foundation

class LoginVo: Mappable {
    
    //MARK:-  Declaration of SignupVo
    var result : [LoginResultVo]?

    var affectedRecords: Int?
    var isSuccess: Bool?
    var endUserMessage: String?
    var validationErrors : NSArray?
    
    //MARK:-  initialization of SignupVo
    
init(result: [LoginResultVo]?,affectedRecords: Int?,isSuccess: Bool?,endUserMessage: String?,validationErrors : NSArray?) {
        self.affectedRecords = affectedRecords
        
        self.isSuccess = isSuccess
        self.endUserMessage = endUserMessage
        self.validationErrors = validationErrors
        
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        result <- map["result"]
        affectedRecords <- map["affectedRecords"]
        
        isSuccess <- map["isSuccess"]
        endUserMessage <- map["endUserMessage"]
        validationErrors <- map["validationErrors"]
    }
   /* contactNumber = 2457561545;
    email = "madu@gmail.com";
    id = 15;
    mobileNumber = 9090909090;
    name = "madu babu madubabu";
    roleId = 1;
    roleName = "Superadmin (SA)";
    userId = "1c4f6267-ce72-4ece-a177-37fc79836363";
    userName = Madu; */

    
    //MARK:-  Declaration of VideosVO
      
    
}

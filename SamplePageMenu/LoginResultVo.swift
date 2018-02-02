//
//  LoginResultVo.swift
//  Telugu Churches
//
//  Created by praveen dole on 2/2/18.
//  Copyright © 2018 Mac OS. All rights reserved.
//

import Foundation


class LoginResultVo: Mappable {
    
    
    //MARK:-  Declaration of SignupVo
    
    var result: LoginVo?
    var affectedRecords: Int?
    var listResult: String?
    var isSuccess: Bool?
    var endUserMessage: String?
    var validationErrors : NSArray?
    
    //MARK:-  initialization of SignupVo
    
    init(result: LoginVo?,affectedRecords: Int?,listResult: String?,isSuccess: Bool?,endUserMessage: String?,validationErrors : NSArray?) {
        self.result = result
        self.affectedRecords = affectedRecords
        self.listResult = listResult
        self.isSuccess = isSuccess
        self.endUserMessage = endUserMessage
        self.validationErrors = validationErrors
        
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        result <- map["result"]
        affectedRecords <- map["affectedRecords"]
        listResult <- map["listResult"]
        isSuccess <- map["isSuccess"]
        endUserMessage <- map["endUserMessage"]
        validationErrors <- map["validationErrors"]
    }
}

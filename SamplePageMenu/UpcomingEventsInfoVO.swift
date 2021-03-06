//
//  UpcomingEventsInfoVO.swift
//  Telugu Churches
//
//  Created by Manoj on 09/03/18.
//  Copyright © 2018 Mac OS. All rights reserved.
//

import Foundation

class UpcomingEventsInfoVO: Mappable {
    
//    
//    {
//    "listResult": [
//    "isSuccess": true,
//    "affectedRecords": 0,
//    "totalRecords": 16,
//    "endUserMessage": "Get All Successful",
//    "validationErrors": [],
//    "exception": null
//    }
    
    
    var listResult : [UpcomingEventsResultVO]?
    var isSuccess    : Bool?
    var totalRecords : Int?
    var affectedRecords : Int?
    var endUserMessage : String?
    var validationErrors : String?
    var exception : Any?
    
    
    //MARK:-  initialization of VideosVO
    
    
    init(listResult : [UpcomingEventsResultVO]?, isSuccess : Bool?, totalRecords:Int?, affectedRecords:Int?,endUserMessage:String?, validationErrors:String?,exception:Any?) {
        
        self.listResult = listResult
        self.isSuccess = isSuccess
        self.totalRecords = totalRecords
        self.affectedRecords = affectedRecords
        self.endUserMessage = endUserMessage
        self.validationErrors = validationErrors
        self.exception = exception
        
        
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        listResult <- map["listResult"]
        isSuccess <- map["isSuccess"]
        totalRecords <- map["totalRecords"]
        affectedRecords <- map["affectedRecords"]
        endUserMessage <- map["endUserMessage"]
        validationErrors <- map["validationErrors"]
        exception <- map["exception"]
        
    }
}

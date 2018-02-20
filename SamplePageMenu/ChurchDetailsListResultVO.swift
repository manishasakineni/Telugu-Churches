//
//  ChurchDetailsListResultVO.swift
//  Telugu Churches
//
//  Created by N@n!'$ Mac on 19/02/18.
//  Copyright © 2018 Mac OS. All rights reserved.
//

import Foundation
class ChurchDetailsListResultVO: Mappable {
    
    //MARK:-  Declaration of VideosVO
    
/*    {
    "id": 3,
    "name": "Christian Church",
    "registrationNumber": "REG002",
    "address1": "Address1",
    "address2": "Address2",
    "landMark": "LandMark",
    "countryId": 1,
    "countryName": "India",
    "stateId": 1,
    "stateName": "Andhra Pradesh",
    "districtId": 1,
    "districtName": "Guntur",
    "mandalId": 1,
    "mandalName": "Cherukupalli",
    "villageId": 2,
    "villageName": "Cherukupalli",
    "description": "Description",
    "mission": "Mission",
    "vision": "Vision",
    "contactNumber": "9632145875",
    "email": "jesus@christ.in",
    "websiteAddress": "www.ChristChurch.in",
    "openingTime": 9,
    "closingTime": 21,
    "churchImage": null,
    "userImage": null,
    "pasterUserId": 4,
    "isActive": true,
    "pasterUser": "Harshitha Garigipati",
    "createdByUser": "Prabhakar Rao Gurram",
    "updatedByUser": "Aishwarya Sateesh S",
    "updatedDate": "2018-10-02T00:00:00"
    }
   
 */
    var Id : Int?
    var name : String?
    var registrationNumber    : String?
    var totalRecords : Int?
    var affectedRecords : Int?
    var endUserMessage : String?
    var validationErrors : String?
    var exception : Any?
    
    
    //MARK:-  initialization of VideosVO
    
    
    init(Id:Int?, name : String?) {
        
        self.Id = Id
        self.name = name
        
        
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        Id <- map["Id"]
        name <- map["name"]
      
        
    }
    
    
}

//
//  Constants.swift
//  Telugu Churches
//
//  Created by N@n!'$ Mac on 19/01/18.
//  Copyright © 2018 Mac OS. All rights reserved.
//

import Foundation


 // MARK: -  API's

let videosURL = "http://192.168.1.123/TeluguChurchesApi/api/GetEmbedLinks/"

//http://192.168.1.121/TeluguChurches/api/Church/GetAllChurches




var BASEURL:String = "http://192.168.1.101/TeluguChurches/"

let SIGNEUPURL:String = BASEURL.appending("api/Account/Register")
let LOGINURL : String = BASEURL.appending("api/UserInfo/LoginUser/")


let CHANGEPASSWORDURL:String = BASEURL.appending("api/Account/ChangePassword")
let EDITPROFILEURL : String = BASEURL.appending("api/UserInfo/UpdateUserInfo")
let PROFILEGETINFO : String = BASEURL.appending("api/UserInfo/GetUserInfo/")
let GETALLCHURCHES : String = BASEURL.appending("api/Church/GetAllChurches")
let GETCHURCHEBYID : String = BASEURL.appending("api/Church/GetChurchbyId/")
let GETALLCHURCHEADMINS : String = BASEURL.appending("api/Church/GetAllChurchAdmins")
let GETEVENTBYUSERIDMONTHYEAR : String = BASEURL.appending("api/Events/GetEventByUserIdMonthYear/")
let GETEVENTBYDATEANDUSERID : String = BASEURL.appending("api/Events/GetEventByDateAndUserId/")
let GETUPCOMIMGEVENTSINFO : String = BASEURL.appending("api/Events/GetUpcomingEventsInfo")


// MARK: -  Navigation String


let KFirstTimeLogin = "first Time Login"

let kuserId:String = "kuserId"
let kLoginId:String = "kloginId"
let kfirstName:String  = "kfirsrName"
let kmiddleName:String  = "kmiddleName"
let klastName:String  = "klastName"
let kmobileNumber:String  = "kmobileNumber"
let kpassword:String  = "kpassword"
let kemail:String  = "kemail"
let kLoginSucessStatus:String = "kLoginSucessStatus"
let kRegisterSucessStatus:String = "kRegisterSucessStatus"
//let kchurchID:String = "kchurchID"


let kTokenType = "tokenType"
let accessToken:String = "accessToken"





let kNetworkStatusMessage = "Please Check Your Internet Connection"
let kToastDuration  = 1.5
let kRequestTimedOutMessage = "Therequest Timed Out"





struct ScreenSize {
    
    static let SCREEN_WIDTH         = UIScreen.main.bounds.size.width
    static let SCREEN_HEIGHT        = UIScreen.main.bounds.size.height
    static let SCREEN_MAX_LENGTH    = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    static let SCREEN_MIN_LENGTH    = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    
}










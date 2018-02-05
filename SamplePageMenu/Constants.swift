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



var BASEURL:String = "http://192.168.1.121/TeluguChurches/"
let SIGNEUPURL:String = BASEURL.appending("api/Account/Register")
let LOGINURL : String = BASEURL.appending("api/UserInfo/LoginUser/")


let CHANGEPASSWORDURL:String = BASEURL.appending("api/Account/ChangePassword")



// MARK: -  Navigation String


let KFirstTimeLogin = "first Time Login"

let kUserId:String = "kUserId"


let kTokenType = "tokenType"
let accessToken:String = "accessToken"





let kNetworkStatusMessage = "Please Check Your Internet Connection"
let kToastDuration  = 3.0
let kRequestTimedOutMessage = "Therequest Timed Out"





struct ScreenSize {
    
    static let SCREEN_WIDTH         = UIScreen.main.bounds.size.width
    static let SCREEN_HEIGHT        = UIScreen.main.bounds.size.height
    static let SCREEN_MAX_LENGTH    = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    static let SCREEN_MIN_LENGTH    = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    
}










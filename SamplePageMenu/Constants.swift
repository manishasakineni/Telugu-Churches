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


// MARK: -  Navigation String


let KFirstTimeLogin = "first Time Login"


let kTokenType = "tokenType"


struct ScreenSize {
    
    static let SCREEN_WIDTH         = UIScreen.main.bounds.size.width
    static let SCREEN_HEIGHT        = UIScreen.main.bounds.size.height
    static let SCREEN_MAX_LENGTH    = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    static let SCREEN_MIN_LENGTH    = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    
}










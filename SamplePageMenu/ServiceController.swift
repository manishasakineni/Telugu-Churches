//
//  ServiceController.swift
//  Telugu Churches
//
//  Created by N@n!'$ Mac on 19/01/18.
//  Copyright © 2018 Mac OS. All rights reserved.
//

import Foundation


//let reachability = Reachability()!
var appDelegate = AppDelegate()

let content_type = "application/json; charset=utf-8"

class ServiceController: NSObject {
    
    func requestGETURL(strURL:String,success:@escaping(_ _result:AnyObject)->Void,failure:@escaping(_ error:String) -> Void) {
        
        appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
//        if appDelegate.checkInternetConnectivity() == false
//        {
//            UIApplication.shared.isNetworkActivityIndicatorVisible = false
//            appDelegate.window?.makeToast(kNetworkStatusMessage, duration: kToastDuration, position: CSToastPositionBottom)
//            return
//        }
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
//        MBProgressHUD.hide(for:appDelegate.window,animated:true)
//        MBProgressHUD.showAdded(to:appDelegate.window,animated:true)
        
        
        let request = NSMutableURLRequest(url: NSURL(string: strURL)! as URL)
        request.addValue(content_type, forHTTPHeaderField: "Content-Type")
        request.addValue(content_type, forHTTPHeaderField: "Accept")
        //// request.setValue(api_key, forHTTPHeaderField: "api_key")
        //        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        //        request.setValue("Keep-Alive", forHTTPHeaderField: "Connection")
        request.httpMethod = "GET"
        
//        let defaults = UserDefaults.standard
//        
//        if let authToken = defaults.string(forKey: accessToken) {
//            
//            request.setValue("Bearer" + " " + authToken,forHTTPHeaderField: "Authorization")
//            
//        }
        
        
        let task = URLSession.shared.dataTask(with:request as URLRequest){(data,response,error) in
            DispatchQueue.main.async(){
           //     MBProgressHUD.hide(for:appDelegate.window,animated:true)
                
                if response != nil {
                    
                    let statusCode = (response as! HTTPURLResponse).statusCode
                    print("statusCode:\(statusCode)")
                    
                    if statusCode == 401 {
                        
                        failure("unAuthorized")
                        //self.refreshTokenForLogin()
                        
                        //                    let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                        //
                        //                    let viewController = mainStoryboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                        //                    let appDelegate = UIApplication.shared.delegate as! AppDelegate
                        //                    appDelegate.window?.rootViewController = viewController
                        
                    }
                    else if error != nil
                    {
                        UIApplication.shared.isNetworkActivityIndicatorVisible = false
                        
                        //                    failure(error! as NSError)
                        
//                        appDelegate.window?.makeToast(error?.localizedDescription, duration:kToastDuration , position:CSToastPositionCenter)
                        
                    }
                        
                    else
                    {
                        UIApplication.shared.isNetworkActivityIndicatorVisible = false
                        
                        do{
                            let parsedData = try JSONSerialization.jsonObject(with:data!,options:.mutableContainers) as![Any]
                            print(parsedData)
                            success(parsedData as AnyObject)
                        }
                        catch{
                            print("error=\(error)")
                            //                        appDelegate.window?.makeToast(error.localizedDescription, duration:kToastDuration , position:CSToastPositionCenter)
                            
                            //                        appDelegate.window?.makeToast("Your session has been timed out. Please login again", duration:kToastDuration , position:CSToastPositionCenter)
                            
                            
                            return
                        }
                        
                    }
                }
                
            }
        }
        task.resume()
}



}

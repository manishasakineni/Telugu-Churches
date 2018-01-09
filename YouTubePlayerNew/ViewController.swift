//
//  ViewController.swift
//  YouTubePlayerNew
//
//  Created by amit sahu on 08/08/16.
//  Copyright © 2016 tpcg. All rights reserved.
//

import UIKit
import youtube_ios_player_helper

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate ,YTPlayerViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
     @IBOutlet weak var minimizeButton: UIButton!
    @IBOutlet weak var player: YTPlayerView!
    
    var state = stateOfVC.hidden
  

    
    var playerVars = Dictionary<String, Any>()
    var name = ["calvarychurch","calvarychurch1","calvarychurch","calvarychurch1","calvarychurch","calvarychurch1"]
    
    var videosIDArray = ["knaCsR6dr58","SG-G0lgEtMY","yvhrORy4x30","knaCsR6dr58","SG-G0lgEtMY","yvhrORy4x30"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Request to turn on accelerometer and begin receiving accelerometer events
        
        tableView.delegate = self
        tableView.dataSource = self

        
        player.delegate = self
        
         playerVars = [
            "controls": 1,
            "playsinline" : 1,
           // "autoplay" : 1,
            "autohide" : 1,
            "rel" : 0,
            "showinfo" : 0,
            //"showing" : 0,
            "modestbranding" : 1,

        ]
        
        let nibName1  = UINib(nibName: "VideoTableViewCell" , bundle: nil)
        tableView.register(nibName1, forCellReuseIdentifier: "VideoTableViewCell")
        

      //  https://www.youtube.com/watch?v=knaCsR6dr58  knaCsR6dr58
        
         self.player.load(withVideoId: self.videosIDArray[0],playerVars: playerVars)
        
       
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func animate()  {
        switch self.state {
        case .fullScreen:
            UIView.animate(withDuration: 0.3, animations: {
                self.minimizeButton.alpha = 1
                self.tableView.alpha = 1
                self.player.transform = CGAffineTransform.identity
                UIApplication.shared.isStatusBarHidden = true
            })
        case .minimized:
            UIView.animate(withDuration: 0.3, animations: {
                UIApplication.shared.isStatusBarHidden = false
                self.minimizeButton.alpha = 0
                self.tableView.alpha = 0
                let scale = CGAffineTransform.init(scaleX: 0.5, y: 0.5)
                let trasform = scale.concatenating(CGAffineTransform.init(translationX: -self.player.bounds.width/4, y: -self.player.bounds.height/4))
                self.player.transform = trasform
            })
        default: break
        }
    }
    
    
     func numberOfSections(in tableView: UITableView) -> Int {
        
        
        return 1
     }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        
        return name.count
        
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat{
        
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      
        return UITableViewAutomaticDimension
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
    
        let allOffersCell = tableView.dequeueReusableCell(withIdentifier: "VideoTableViewCell", for: indexPath) as! VideoTableViewCell
        allOffersCell.label.text = name[indexPath.row]
        allOffersCell.IdLabel.text = self.videosIDArray[indexPath.row]
        return allOffersCell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        

        self.player.load(withVideoId: self.videosIDArray[indexPath.row],playerVars: playerVars)
        
        
    }
    


    
//    override var shouldAutorotate : Bool {
//        if (UIDevice.current.orientation == UIDeviceOrientation.portrait ||
//            UIDevice.current.orientation == UIDeviceOrientation.portraitUpsideDown ||
//            UIDevice.current.orientation == UIDeviceOrientation.unknown) {
//            return true
//        }
//        else {
//            return false
//        }
//    }
    

    
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.all
    }


}


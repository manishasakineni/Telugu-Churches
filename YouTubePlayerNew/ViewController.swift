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

    @IBOutlet weak var player: YTPlayerView!
    
    
    var name = ["calvarychurch","calvarychurch1","calvarychurch","calvarychurch1","calvarychurch","calvarychurch1"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Request to turn on accelerometer and begin receiving accelerometer events
        
        tableView.delegate = self
        tableView.delegate = self

        
        player.delegate = self
        
        let playerVars = [
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
        

      //  https://www.youtube.com/watch?v=knaCsR6dr58
        
       self.player.load(withVideoId: "knaCsR6dr58",playerVars: playerVars)
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
        
        
        
        
        return allOffersCell
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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


//
//  AllOffersViewController.swift
//  OffersScreen
//
//  Created by Mac OS on 21/12/17.
//  Copyright © 2017 Mac OS. All rights reserved.
//

import UIKit
import youtube_ios_player_helper

class AllOffersViewController: UIViewController,UITableViewDelegate ,UITableViewDataSource,UIScrollViewDelegate,YTPlayerViewDelegate{

    
    @IBOutlet weak var allOffersTableView: UITableView!
    var delegate: changeSubtitleOfIndexDelegate?
    
    @IBOutlet weak var player: YTPlayerView!
    
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var textView: UITextView!
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var skipButton: UIButton!
    
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!

    @IBOutlet weak var loadingImg: UIImageView!
    
    


    let imageView = ["bible1","bible2","bible3","images.jpeg","7c26c4322705738c08d90691d32ff29b-brown-bible","bible9","bible8","bible7","bible6"]
    
    
    let imageView1 = ["bible6","bible7","bible8","bible9","images.jpeg","bible3","bible8","bible2","bible1"]
    
var playerVars = Dictionary<String, Any>()
    var name = ["calvarychurch","calvarychurch1","calvarychurch","calvarychurch1","calvarychurch","calvarychurch1"]
    
    var videosIDArray = ["knaCsR6dr58","SG-G0lgEtMY","yvhrORy4x30","knaCsR6dr58","SG-G0lgEtMY","yvhrORy4x30"]

    
    override func viewDidLoad() {
        super.viewDidLoad()

        allOffersTableView.delegate = self
        allOffersTableView.dataSource = self
        
        self.player.delegate = self
        
        playerVars = [
            "controls" : 1 ,
            "playsinline" : 1,
            "autoplay" : 1,
         //   "autohide" : 1,
            "rel" : 0,
           "showinfo" : 0,
            //"showing" : 0,
            "modestbranding" : 1,
            
           
            
        ]
        
      //  self.loadingImg.image = UIImage(named: "Video")

        self.player.load(withVideoId: self.videosIDArray[0],playerVars: playerVars)

        
        registerTableViewCells()
        
 
    }
    


    
    private func registerTableViewCells() {
        

        
        let nibName1  = UINib(nibName: "VideoTableViewCell" , bundle: nil)
        allOffersTableView.register(nibName1, forCellReuseIdentifier: "VideoTableViewCell")
   
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
    
    
//    open func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
//        
//        let url = request.url
//        
//        // Check if ytplayer event and, if so, pass to handleJSEvent
//        if let url = url, url.scheme == "ytplayer"
//        
//        
//        
//        if navigationType == UIWebViewNavigationType.linkClicked {
//            UIApplication.sharedApplication.openURL(request.URL)
//            return false
//        }
//        return true
//    }
//    
    
    
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        
        // self.loadingImg.image = UIImage(named: "video")
        
        player.playVideo()
        
    }
    
    func playerView(_ playerView: YTPlayerView, didChangeTo state: YTPlayerState) {
        switch state {
        case .buffering:
            fallthrough
        case .playing: break
       //     hidePoster()
        case .ended:
            fallthrough
        case .paused: break
       //     showPoster()
        default:
            ()
        }
    }
    
    internal func updateTimer(){
//
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    

}

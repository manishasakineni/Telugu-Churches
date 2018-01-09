# YouTubePlayer youtube-ios-player-helper
<img src="https://camo.githubusercontent.com/0ffde138998b72aab7bc949404cdbebebb4983a6/68747470733a2f2f636f636f61706f642d6261646765732e6865726f6b756170702e636f6d2f702f796f75747562652d696f732d706c617965722d68656c7065722f62616467652e706e67" alt="Platform" data-canonical-src="https://cocoapod-badges.herokuapp.com/p/youtube-ios-player-helper/badge.png" style="max-width:100%;"> ios swift
#Pod Installation 

include below line on your Podfile 

pod 'youtube-ios-player-helper', :git=>'https://github.com/youtube/youtube-ios-player-helper', :commit=>'head'

#Setting
After installing in your project and opening the workspace, to use the library:

  1. Drag a View the desired size of your player onto your Storyboard.
  2. Change the View's class in the Identity Inspector tab to YTPlayerView
  3. Import "import youtube_ios_player_helper" in your ViewController.
  4. Add the following property to your ViewController's header file:
  
     @IBOutlet weak var player: YTPlayerView!
     
      let playerVars = [

            "controls": 0,
            
            "playsinline" : 0,
            
            "autoplay" : 1,
            
            "autohide" : 1,
            
            "rel" : 0,
            
            "showinfo" : 0,
            
            "modestbranding" : 1
        ]
      multiple option for your player.
      
      Play video with video ID:
      
      player.loadWithVideoId("YOUTUBE_VIDEO_ID",playerVars: playerVars)

IOS Swift Youtube player with player vars

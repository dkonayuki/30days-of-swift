//
//  ViewController.swift
//  Navigation
//
//  Created by dkonayuki on 3/10/16.
//  Copyright © 2016 ChillBears. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer

class ViewController: UIViewController {

    @IBOutlet var playButton: UIButton!
    @IBAction func buttonPressed(sender: AnyObject) {
        toggle()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    var player = AVPlayer()

    func toggle() {
        if playButton.titleLabel?.text == "Play" {
            playRadio()
        } else {
            pauseRadio()
        }
    }
    
    func playRadio() {
        player.play()
        playButton.setTitle("Pause", forState: UIControlState.Normal)
    }
    
    func pauseRadio() {
        player.pause()
        playButton.setTitle("Play", forState: UIControlState.Normal)
    }
    
    func configureView() {
        
        let url = "http://bbcmedia.ic.llnwd.net/stream/bbcmedia_radio1_mf_q?s=1457608133&e=1457622533&h=0f160d6d366f473fdce7176dba7c833d"
        let playerItem = AVPlayerItem( URL:NSURL( string:url )! )
        player = AVPlayer(playerItem:playerItem)
        player.rate = 1.0
    }

}


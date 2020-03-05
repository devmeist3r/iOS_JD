//
//  ViewController.swift
//  playerSom
//
//  Created by Lucas Inocencio on 24/10/18.
//  Copyright © 2018 Lucas Inocencio. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    //Outlets
    @IBOutlet weak var slVolume: UISlider!
    
    // Variables
    var player = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let path = Bundle.main.path(forResource: "bach", ofType: "mp3") {
            let url = URL(fileURLWithPath: path)
            
            do {
                player = try AVAudioPlayer(contentsOf: url)
                player.prepareToPlay()
                
            } catch  {
                print("error")
            }
        }
    }
    
    @IBAction func controlVolume(_ sender: Any) {
        player.volume = slVolume.value
    }
    
    @IBAction func playTapped(_ sender: Any) {
        player.play()
    }
    
    @IBAction func pauseTapped(_ sender: Any) {
        player.pause()
    }
    
    @IBAction func stopTapped(_ sender: Any) {
        player.stop()
        player.currentTime = 0
    }
    

}


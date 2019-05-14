//
//  ViewController.swift
//  Simple Audio Player
//
//  Created by RAMDHAN CHOUDHARY on 14/05/19.
//  Copyright © 2019 RDC. All rights reserved.
//

import UIKit
import  AVFoundation

class ViewController: UIViewController {
    
    // MARK: Variables declearations
    var player: AVAudioPlayer?
    let mp3FileName = "Theatre-applause"

    // MARK: View Controller life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        //TODO: Make sure you add and copy mp3 file to your project and provide profile file name, extension
    }
    
    
    // MARK: Button action methods
    @IBAction func playAudio(_ sender: Any) {
        
        //file type can be mp3 or wav etc.
        //get file path from resources
        guard let url = Bundle.main.url(forResource: mp3FileName, withExtension: "mp3") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            /* iOS 10 and earlier require the following line:
             player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
            
            guard let player = player else { return }
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
        
        
    }
    
    //Check Audioplayer instance and pause
    @IBAction func pauseAudio(_ sender: Any) {
        
            guard let player = player else { return }
            player.pause()
        
    }
    

}


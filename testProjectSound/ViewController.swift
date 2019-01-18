//
//  ViewController.swift
//  testProjectSound
//
//  Created by Manuel López Ramos on 18/01/2019.
//  Copyright © 2019 Manuel López Ramos. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    var player: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func pressButton(_ sender: UIButton) {
//        print(String(sender.tag))
        playSound(audioTag: String(sender.tag))
    }
    
    func playSound(audioTag: String){
        guard let url = Bundle.main.url(forResource: "note\(audioTag)", withExtension: "wav") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)
            
            guard let player = player else { return }
            
            player.play()
            
        } catch let error{
            print(error.localizedDescription)
        }
        
        
    }


}


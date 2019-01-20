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
        
        //Botones programaticamente
        createButtons()
        
    }
    
    func createButtons (){
        let colors = [1:UIColor.red,
                      2:UIColor.blue,
                      3:UIColor.green,
                      4:UIColor.yellow,
                      5:UIColor.cyan,
                      6:UIColor.brown,
                      7:UIColor.orange]
        
        for i in 1...7 {
            
            let button = UIButton()
            
            button.translatesAutoresizingMaskIntoConstraints = false
            
            button.backgroundColor = .blue
            
            self.view.addSubview(button)
            button.topAnchor.constraint(equalTo: self.view.topAnchor, constant: CGFloat(0 + 80 * i)).isActive = true
            button.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20).isActive = true
            button.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20).isActive = true
            button.heightAnchor.constraint(equalToConstant: 60).isActive = true
            
            button.backgroundColor = colors[i]
            button.tag = i
            button.addTarget(self, action: #selector(pressButton), for: .touchUpInside)
        }
    }
    
    @objc func pressButton(sender: UIButton!) {
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


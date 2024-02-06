//
//  DemoSoundManager.swift
//
//
//  Created by Archit Anant on 06/02/24.
//

import AVKit

class DemoSoundManager{
    static let instance = DemoSoundManager()
    
    var player : AVAudioPlayer?
    
    func playDemoSong(){
        guard let url = Bundle.main.url(forResource: "demo", withExtension: ".mp3") else {return}
        do{
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        }catch  _{
            print("Kuch to hua bhai!")
        }
    }
    
    func killAudio(){
        player?.stop()
    }
}

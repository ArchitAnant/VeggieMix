//
//  BiteSoundManager.swift
//  
//
//  Created by Archit Anant on 24/01/24.
//

import AVKit

class BiteSoundManager{

    static let instance = BiteSoundManager()

    private var player: AVAudioPlayer?

    enum soundOptions: String{
        case applebite
        case carrotbite
        case slimebite
    }

    func playAudio(sound : soundOptions){
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else {return}

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
    func currAudio()->String{
        if ((player?.isPlaying) != false) {
            return player?.url?.absoluteString ?? ""
        }
        else{
            return ""
        }
        
    }
}


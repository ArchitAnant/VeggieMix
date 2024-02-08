//
//  BaseSoundManager.swift
//  
//
//  Created by Archit Anant on 24/01/24.
//

import AVKit
import SwiftUI

class BaseSoundManager{
    @StateObject var vm = ViewModel()
    static let instance = BaseSoundManager()
    
    var player: AVAudioPlayer?
    
    enum soundOptions: String{
        case drumbeat
        case guitarbase
        case pianobase
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
    func getTimeStamp(vm : ViewModel){
        print(player?.currentTime ?? "NA")
    }
}

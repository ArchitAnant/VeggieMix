//
//  ViewModel.swift
//  VeggieMix
//
//  Created by Archit Anant on 05/02/24.
//

import SwiftUI

class ViewModel: ObservableObject {
    @Published var drumColor:Color = BaseColor
    @Published var pianoColor:Color = BaseColor
    @Published var guitarColor:Color = BaseColor
    
    
    @State private var currentPlayTime: TimeInterval = 0 
    
    func playGuitarMusic(){
        if BaseSoundManager.instance.currAudio().contains("guitar") {
            BaseSoundManager.instance.killAudio()
            guitarColor = BaseColor
        }
        else {
            BaseSoundManager.instance.playAudio(sound: .guitarbase)
            guitarColor = BasePalletColor
            drumColor = BaseColor
            pianoColor = BaseColor
            
        }
        
    }
    func playDrumMusic(){
        if  BaseSoundManager.instance.currAudio().contains("drumbeat") {
            BaseSoundManager.instance.killAudio()
            drumColor = BaseColor
        }
        else {
            BaseSoundManager.instance.playAudio(sound: .drumbeat)
            guitarColor = BaseColor
            drumColor = BasePalletColor
            pianoColor = BaseColor
            
        }
    }
    func playPianoMusic(){
        if BaseSoundManager.instance.currAudio().contains("piano") {
            BaseSoundManager.instance.killAudio()
            pianoColor = BaseColor
        }
        else {
            BaseSoundManager.instance.playAudio(sound: .pianobase)
            guitarColor = BaseColor
            drumColor = BaseColor
            pianoColor = BasePalletColor
            
        }
    }
    func stopButton(){
        BaseSoundManager.instance.killAudio()
        BiteSoundManager.instance.killAudio()
        GrateSoundManager.instance.killAudio()
        HitSoundManager.instance.killAudio()
        StabSoundManager.instance.killAudio()
        
        guitarColor = BaseColor
        drumColor = BaseColor
        pianoColor = BaseColor
    }
    
    @Published var highHitSweetPotato : Color = fontColor
    @Published var highStabCarrot : Color = fontColor
    @Published var highHitPomelo : Color = fontColor
    @Published var highGratePepper : Color = fontColor
    @Published var highStabCabbage : Color = fontColor
    @Published var playVid  = false
    
    func highPepper(){
        highGratePepper = .cyan
        highHitPomelo = fontColor
        highStabCarrot = fontColor
        highHitSweetPotato = fontColor
        highStabCabbage = fontColor
    }
    func highPomelo(){
        highGratePepper = fontColor
        highHitPomelo = .cyan
        highStabCarrot = fontColor
        highHitSweetPotato = fontColor
        highStabCabbage = fontColor
        
    }
    func highCarrot(){
        highGratePepper = fontColor
        highHitPomelo = fontColor
        highStabCarrot = .cyan
        highHitSweetPotato = fontColor
        highStabCabbage = fontColor
    }
    func highSweetPotato(){
        highGratePepper = fontColor
        highHitPomelo = fontColor
        highStabCarrot = fontColor
        highHitSweetPotato = .cyan
        highStabCabbage = fontColor
    }
    func highCabbage(){
        highGratePepper = fontColor
        highHitPomelo = fontColor
        highStabCarrot = fontColor
        highHitSweetPotato = fontColor
        highStabCabbage = .cyan
    }
    func resetAll(){
        highGratePepper = fontColor
        highHitPomelo = fontColor
        highStabCarrot = fontColor
        highHitSweetPotato = fontColor
        highStabCabbage = fontColor
    }

}


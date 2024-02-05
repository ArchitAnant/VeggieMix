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
    
}


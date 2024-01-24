//
//  SwiftUIView.swift
//  
//
//  Created by Archit Anant on 18/01/24.
//

import SwiftUI

struct VeggieButton: View {
    var veggieName : String
    var section:String
    var body: some View {
        Button(action: {
            switch "\(veggieName.lowercased())-\(section.lowercased())"{
            case "sweet\npotato-hit :":
                if HitSoundManager.instance.currAudio().contains("sweet") {
                    HitSoundManager.instance.killAudio()
                }
                else {
                    HitSoundManager.instance.playAudio(sound: .sweetpotatohit)
                }
            
            case "pemelo-hit :":
                if HitSoundManager.instance.currAudio().contains("pemelo") {
                    HitSoundManager.instance.killAudio()
                }
                else {
                    HitSoundManager.instance.playAudio(sound: .pomelohit)
                }
            case "carrot-grating :":
                if GrateSoundManager.instance.currAudio().contains("carrot") {
                    GrateSoundManager.instance.killAudio()
                }
                else {
                    GrateSoundManager.instance.playAudio(sound: .carrotgrate)
                }
            case "pepper-grating :":
                if GrateSoundManager.instance.currAudio().contains("pepper") {
                    GrateSoundManager.instance.killAudio()
                }
                else {
                    GrateSoundManager.instance.playAudio(sound: .peppergrate)
                }
            case "apple-biting :":
                if BiteSoundManager.instance.currAudio().contains("apple") {
                    BiteSoundManager.instance.killAudio()
                }
                else {
                    BiteSoundManager.instance.playAudio(sound: .applebite)
                }
            case "slime-biting :":
                if BiteSoundManager.instance.currAudio().contains("slime") {
                    BiteSoundManager.instance.killAudio()
                }
                else {
                    BiteSoundManager.instance.playAudio(sound: .slimebite)
                }
            case "carrot-biting :":
                if BiteSoundManager.instance.currAudio().contains("carrot") {
                    BiteSoundManager.instance.killAudio()
                }
                else {
                    BiteSoundManager.instance.playAudio(sound: .carrotbite)
                }
            case "cabbage-stab :":
                if StabSoundManager.instance.currAudio().contains("cabbage") {
                    StabSoundManager.instance.killAudio()
                }
                else {
                    StabSoundManager.instance.playAudio(sound: .cabbagestab)
                }
            case "celery-stab :":
                if StabSoundManager.instance.currAudio().contains("celery") {
                    StabSoundManager.instance.killAudio()
                }
                else {
                    StabSoundManager.instance.playAudio(sound: .celerystab)
                }
            case "carrot-stab :":
                if StabSoundManager.instance.currAudio().contains("carrot") {
                    StabSoundManager.instance.killAudio()
                }
                else {
                    StabSoundManager.instance.playAudio(sound: .carrotstab)
                }
            default:
                print("\(veggieName.lowercased())-\(section.lowercased())")
            }
            
        }){
            Text(veggieName)
                    .font(customMontFont(size: 19))
                    .foregroundColor(fontColor)
                    .frame(width: 135.68636, height: 72)
        }
        .background(
            BaseColor
        )
        .clipShape(
            RoundedRectangle(cornerRadius: 16)
        )
    }
    
}

#Preview {
    VeggieButton(veggieName: "Apple",section: "temp")
}

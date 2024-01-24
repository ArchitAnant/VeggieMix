//
//  SwiftUIView.swift
//  
//
//  Created by Archit Anant on 16/01/24.
//
import SwiftUI

struct SingleItem : View{
    var baseIcon:String
    var baseIntstument:String
    var body:some View{
        Button(action: {
            switch baseIntstument{
            case "Guitar":
                if BaseSoundManager.instance.currAudio().contains("guitar") {
                    BaseSoundManager.instance.killAudio()
                }
                else {
                    BaseSoundManager.instance.playAudio(sound: .guitarbase)
                }
            case "Drum":
                if BaseSoundManager.instance.currAudio().contains("drumbeat") {
                    BaseSoundManager.instance.killAudio()
                }
                else {
                    BaseSoundManager.instance.playAudio(sound: .drumbeat)
                }
            case "Piano":
                if BaseSoundManager.instance.currAudio().contains("piano") {
                    BaseSoundManager.instance.killAudio()
                }
                else {
                    BaseSoundManager.instance.playAudio(sound: .pianobase)
                }
            default:
                print("Just a base button!")
            }
            print()
            
        }){
            HStack{
                Text(baseIcon)
                    .font(customMontFont(size: 35))
                    .padding([.trailing],7)
                Text(baseIntstument)
                    .font(customMontFont(size: 20))
                    .foregroundColor(BaseButtonColor)
                
            }
            .frame(width: 196.56088, height: 87)
            
        }
        .background(
            BaseColor
        )
        .clipShape(
            RoundedRectangle(cornerRadius: 22)
        )
        
    }
}

#Preview {
    SingleItem(baseIcon: "🎸", baseIntstument: "Guitar")
}

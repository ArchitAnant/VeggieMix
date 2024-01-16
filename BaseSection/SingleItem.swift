//
//  SwiftUIView.swift
//  
//
//  Created by Archit Anant on 16/01/24.
//
import SwiftUI
import AVKit

class SoundManager{
    
    static let instance = SoundManager()
    
    var player: AVAudioPlayer?
    
    enum soundOptions: String{
        case CarrotG
        case drumbeat
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
}
class SoundManager1{
    
    static let instance1 = SoundManager()
    
    var player1: AVAudioPlayer?
    
    enum soundOptions: String{
        case CarrotG
        case drumbeat
    }
    
    func playAudio(sound : soundOptions){
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else {return}
        
        do{
            player1 = try AVAudioPlayer(contentsOf: url)
            player1?.play()
        }catch  _{
            print("Kuch to hua bhai!")
        }
    }
}




struct SingleItem : View{
    var baseIcon:String
    var baseIntstument:String
    var body:some View{
        Button(action: {
            if baseIntstument == "Guitar"{
                SoundManager.instance.playAudio(sound: .CarrotG)
            }
            else if baseIntstument == "Piano" {
                SoundManager1.instance1.playAudio(sound: .drumbeat)
            }
        }){
            HStack{
                Text(baseIcon)
                    .font(Font.custom("Andale Mono", size: 35))
//                    .foregroundColor(.white)
                    .padding([.trailing],7)
                Text(baseIntstument)
                    .font(Font.custom("Andale Mono", size: 20))
                    .foregroundColor(BaseButtonColor)
                
            }
            .frame(width: 196.56088, height: 87)
            
        }
        .background(
            RoundedRectangle(cornerRadius: 22)
                            .inset(by: 1)
                            .stroke(Color(red: 0.37, green: 0.52, blue: 0.7), lineWidth: 2)
        )
        
//        .buttonBorderShape(
//            ButtonBorderShape.roundedRectangle(radius: 22)
//        )
//        .buttonStyle(.borderedProminent)
//        .frame(width: 196.56088, height: 87)
//        .background(Color(red: 0.05, green: 0.11, blue: 0.17))
//        
//        .cornerRadius(22)
//        .overlay(
//            RoundedRectangle(cornerRadius: 22)
//                .inset(by: 1)
//                .stroke(Color(red: 0.37, green: 0.52, blue: 0.7), lineWidth: 2)
//            
//        )
        
    }
}

#Preview {
    SingleItem(baseIcon: "🎸", baseIntstument: "Guitar")
}

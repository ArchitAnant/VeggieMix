//
//  SwiftUIView.swift
//  
//
//  Created by Archit Anant on 16/01/24.
//
import SwiftUI
import AVKit

//class SoundManager{
//    
//    static let instance = SoundManager()
//    
//    var player: AVAudioPlayer?
//    
//    enum soundOptions: String{
//        case CarrotG
//        case drumbeat
//    }
//    
//    func playAudio(sound : soundOptions){
//        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else {return}
//        
//        do{
//            player = try AVAudioPlayer(contentsOf: url)
//            player?.play()
//        }catch  _{
//            print("Kuch to hua bhai!")
//        }
//    }
//}




struct SingleItem : View{
    var baseIcon:String
    var baseIntstument:String
    var body:some View{
        Button(action: {
            
        }){
            HStack{
                Text(baseIcon)
                    .font(Font.custom("Andale Mono", size: 35))
                    .padding([.trailing],7)
                Text(baseIntstument)
                    .font(Font.custom("Andale Mono", size: 20))
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

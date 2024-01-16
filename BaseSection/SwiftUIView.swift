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
////    static let instance = SoundManager()
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

let baseIcon :[String] = ["🎸","🎹","🥁","🎻"]
let baseInstument:[String] = ["Guitar","Piano","Drum","Violin"]

struct BasePallet: View {
    var range = baseIcon.indices
    var body: some View {
        ZStack{
            Rectangle()
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,
                       maxWidth: .infinity,
                       minHeight: 0,
                       maxHeight: .infinity)
                .foregroundStyle(BasePalletColor)
            VStack(alignment: .leading){
                Text("Base:")
                    .font(Font.custom("Andale Mono", size: 27))
                    .foregroundColor(Color(red: 0.37, green: 0.52, blue: 0.7))
                    .padding([.bottom],20)
                HStack{
                    
                    ForEach(range){index in
                        SingleItem(baseIcon: baseIcon[index], baseIntstument: baseInstument[index])
                            .padding([.trailing],10)
                    }
                }
            }
            
        }
        .frame(height: 216)
        .background(BaseColor)
        .cornerRadius(23)
        .padding([.leading,.trailing],100)
    }
}

#Preview{
    BasePallet()
}

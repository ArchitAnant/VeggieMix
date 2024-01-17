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


struct BasePallet: View {

    var body: some View {
        VStack{
            HStack{
                VStack{
                    HStack{
                        Text("Let's")
                            .foregroundStyle(Color(red: 0.58, green: 0.74, blue: 0.93))
                            .font(customMonoFont(size: 30))
                        
                        Image("hold")
                            .offset(y:-3)
                        Text("Some")
                            .foregroundStyle(Color(red: 0.58, green: 0.74, blue: 0.93))
                            .font(Font.custom("Andale Mono", size: 30))
                    }
                    Image("beats")
                }
                Image("arrow")
            }
            
            ZStack{
                VStack{
                    Text("Base:")
                        .font(Font.custom("Andale Mono", size: 27))
                        .foregroundColor(fontColor)
                        .padding([.bottom],20)
                        .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
                    HStack{
                        SingleItem(baseIcon: "🎸", baseIntstument: "Guitar")
                            .padding([.trailing],10)
                        SingleItem(baseIcon: "🎹", baseIntstument: "Piano")
                            .padding([.trailing],10)
                        
                    }
                    HStack{
                        SingleItem(baseIcon: "🥁", baseIntstument: "Drum")
                            .padding([.trailing],10)
                        SingleItem(baseIcon: "🎻", baseIntstument: "Violin")
                            .padding([.trailing],10)
                        
                    }
                }
            }
            .frame(minWidth: 0,
                   maxWidth: .infinity
            )
            .padding(30)
            .background(BasePalletColor)
            .cornerRadius(23)
            .padding([.leading,.trailing],20)
        }
    }
    
}

#Preview{
    BasePallet()
}

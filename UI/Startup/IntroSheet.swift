//
//  SwiftUIView.swift
//  
//
//  Created by Archit Anant on 26/01/24.
//

import SwiftUI

struct IntroSheet: View {
    var onSkip:()->Void
    var onNext:()->Void
    var letsRock:()->Void
    @State var showMusic = false
    
    var body: some View {
        VStack(){
            VStack(alignment:.leading){
                Button(action: {onSkip()}){
                    Text("Skip")
                        .foregroundStyle(fontColor)
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .trailing)
                .padding()
                Text("Hi, This is VeggieMix!")
                    .font(customMontFont(size: 26))
                    .foregroundStyle(fontColor)
                    .padding([.bottom],5)
                Text("Vegetables make quite different types of sound! 🎧\nHave you ever thought of making music out of them!? 🎵")
                    .font(customMontFont(size: 21))
                    .foregroundStyle(fontColor)
                    .padding([.top,.bottom])
                Text("Lets Do It!  🎤")
                    .font(customMontFont(size: 26))
                    .foregroundStyle(fontColor)
                    .padding([.top],5)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                Button(action: {
                    showMusic=true
                }){
                    Text("Next")
                        .foregroundStyle(fontColor)
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .trailing)
                .padding([.leading,.top,.trailing])
                .sheet(isPresented:$showMusic, content: {
                    MusicSheet(playMusic: {
                        letsRock()
                        onSkip()
                    })
                })
            }
            .padding(30)

            Image("veggieVec")
                .resizable()
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .bottom)
                
        }
        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,
               maxWidth: .infinity,
               minHeight: 0,
               maxHeight: .infinity)
        
        .background(BaseColor)
    }
        
}

#Preview {
    IntroSheet(onSkip: {}, onNext: {},letsRock: {})
}

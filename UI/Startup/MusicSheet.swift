//
//  SwiftUIView.swift
//  
//
//  Created by Archit Anant on 03/02/24.
//

import SwiftUI

struct MusicSheet: View {
    var playMusic:()->Void
    var body: some View {
        VStack(){
            VStack(alignment:.leading){
                Spacer()
                    .frame(height: 55)
                Text("Lets, Try Some Classic!")
                    .font(customMontFont(size: 26))
                    .foregroundStyle(fontColor)
                    .padding([.bottom],5)
                Text("Lets, try this to play a classic Michael Jackson song 🪩\nLet me show you how!")
                    .font(customMontFont(size: 21))
                    .foregroundStyle(fontColor)
                    .padding([.top,.bottom])
                Text("Lets Play!  🎤")
                    .font(customMontFont(size: 26))
                    .foregroundStyle(fontColor)
                    .padding([.top],5)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                Button(action: {
                    playMusic()
                }){
                    Text("Next")
                        .foregroundStyle(fontColor)
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .trailing)
                .padding([.leading,.top,.trailing])
            }
            .padding(30)
            Image("soundVec")
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
    MusicSheet(){}
}

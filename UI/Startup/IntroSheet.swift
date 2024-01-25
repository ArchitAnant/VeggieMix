//
//  SwiftUIView.swift
//  
//
//  Created by Archit Anant on 26/01/24.
//

import SwiftUI

struct IntroSheet: View {
    var onSkip:()->Void
    
    var body: some View {
        VStack(alignment:.leading){
            Button(action: {onSkip()}){
                Text("Skip")
            }
            .frame(alignment: .trailing)
            .padding()
            Text("Hi, This is VeggieMix!")
                .font(customMontFont(size: 26))
                .foregroundStyle(fontColor)
                .padding([.bottom],5)
            Text("Vegetables make quite different types of sound! 🎧\nHave you ever thought of making music out of them!? 🎵")
                .font(customMontFont(size: 21))
                .foregroundStyle(fontColor)
            Text("Lets Do It!  🎤")
                .font(customMontFont(size: 26))
                .foregroundStyle(fontColor)
                .padding([.top],5)
            Button(action: {
                
            }){
                Text("Next ->")
            }
            .frame(alignment: .trailing)
            .padding()
        }
        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,
               maxWidth: .infinity,
               minHeight: 0,
               maxHeight: .infinity,
               alignment: .leading)
        .padding()
        .background(BaseColor)
    }
        
}

#Preview {
    IntroSheet(){}
}

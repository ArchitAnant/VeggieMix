//
//  demo.swift
//
//
//  Created by Archit Anant on 05/02/24.
//

import SwiftUI
/*
 The sounds used are
 Hit:
    - Sweet Potato
    - Pomelo
 Stab:
    - Carrot
    - Cabbage
 Grate:
    - Pepper
 */
struct Demo: View {
    var body: some View {
            VStack{
                
                Greet()
//                    .padding(25)
                    .frame(maxWidth: .infinity,alignment: .leading)
                
            }
        .padding(25)
        .background(overlayColor)
    }
}

struct Greet: View {
    @State var fromGreet = false
    var body: some View {
        Spacer()
            .frame(height: 20)
        Image(systemName: fromGreet ? "opticaldisc" : "figure.mind.and.body")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(maxWidth: .infinity)
            .foregroundStyle(fontColor)
            .opacity(0.3)
            .animation(.smooth, value: fromGreet)
        Spacer()
            .frame(height: 30)
        Text(fromGreet ? "Now lets play one of my favorite - Smooth Criminal" : "First let's get some hands on! 👊🏼")
            .font(customMontFont(size: 30))
            .foregroundStyle(fontColor)
            .animation(.smooth, value: fromGreet)
        Spacer()
            .frame(height: 35)
        Text(fromGreet ? "Hit the Play button and see the Magic!" : "Try pressing some buttons\nand see what they dooooooo! 🧐")
            .font(customMontFont(size: 20))
            .foregroundStyle(fontColor)
            .animation(.smooth, value: fromGreet)
        if !fromGreet{
            Spacer()
                .frame(height: 35)
            Text("Then let's move forward\nPress next!")
                .font(customMontFont(size: 20))
                .foregroundStyle(fontColor)
        }
        Spacer()
        HStack{
            if fromGreet{
                Button(action :{
                    
                }){
                    Text("Play")
                        .padding()
                }
                .frame(width: 100)
                .background(BaseButtonColor)
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
            }
            Button(action :{
                fromGreet = true
            }){
                Text("Next")
                    .padding()
            }
            .frame(width: 100)
            .background(BaseButtonColor)
            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
        }
//        .padding()
        
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .trailing)
        .animation(.smooth, value: fromGreet)
    }
}

#Preview {
    Demo()
}


//
//  demo.swift
//
//
//  Created by Archit Anant on 05/02/24.
//

import SwiftUI
import AVKit
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
    @StateObject var vm : ViewModel
    @State var onScreen = 0
    var body: some View {
            VStack{
                if onScreen == 0{
                    Greet(){
                        onScreen+=1
                    }
                    .frame(maxWidth: .infinity,alignment: .leading)
                }
                else{
                    hitIt(vm : vm)
                        .frame(maxWidth: .infinity,alignment: .leading)
                }
                    
                
            }
            .animation(.easeIn,value: onScreen)
        .padding(25)
        .background(overlayColor)
    }
}

struct Greet: View {
    
    var letsRock:()->Void
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
                    fromGreet = false
                }){
                    Text("Back")
                        .font(customMontFont(size: 15))
                        .padding()
                }
                .frame(width: 100)
                .background(BaseButtonColor)
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                
                Button(action :{
                    letsRock()
                }){
                    Text("Play")
                        .font(customMontFont(size: 15))
                        .padding()
                }
                .frame(width: 100)
                .background(BaseButtonColor)
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
            }
            else{
                Button(action :{
                    fromGreet = true
                }){
                    Text("Next")
                        .font(customMontFont(size: 15))
                        .padding()
                }
                .frame(width: 100)
                .background(BaseButtonColor)
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
            }
        }
        
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .trailing)
        .animation(.smooth, value: fromGreet)
    }
}

struct hitIt:View {
    @StateObject var vm : ViewModel
    @State private var timer: Timer?
    @State var counter = 3
    @State var letsGo = false
    let player = AVPlayer(url: Bundle.main.url(forResource: "VeggieMixDemo", withExtension: ".mp4")!)
    
    
    var body: some View{
        VStack {
            Text("Let's Hit It! 👊🏼")
                .font(customMontFont(size: 30))
                .foregroundStyle(fontColor)
                .onAppear{
                    starttimer()
                }
                .padding()
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
            
            
            Text(counter>0 ? "\(counter)" : "Watch!")
                .font(customMontFont(size: 55))
                .foregroundStyle( counter>0 ? fontColor :  BasePalletColor)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            
            
            VideoPlayer(player: player)
                .frame(maxWidth: .infinity,maxHeight: 290)
                .disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)))
                .padding([.bottom])
            
            Button(action :{
                
            }){
                Text("Try It!")
                    .font(customMontFont(size: 15))
                    .padding()
            }
            .frame(width: 100)
            .background(BaseButtonColor)
            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .trailing)
            
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
    }
    func starttimer(){
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if counter>0 {
                counter -= 1
            }
            else{
                player.play()
                timer?.invalidate()
            }
        }
    }
}


#Preview {
    Demo(vm : ViewModel())
}


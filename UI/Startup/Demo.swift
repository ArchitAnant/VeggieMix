//
//  Demo.swift
//
//
//  Created by Archit Anant on 05/02/24.
//

import SwiftUI
import AVKit

struct Demo: View {
    @StateObject var vm : ViewModel
    @State var onScreen = 0
    var body: some View {
            VStack{
                if onScreen == 0{
                    Greet(){
                        onScreen += 1
                    }
                    .frame(maxWidth: .infinity,alignment: .leading)
                }
                else if onScreen == 1 {
                    HitIt(vm : vm){
                        onScreen += 1
                        vm.currIndex = 0
                    }
                        .frame(maxWidth: .infinity,alignment: .leading)
                }
                
                else if onScreen == 2 {
                    Tutorial(vm : vm){
                        onScreen += 1
                    }
                }
                else if onScreen == 3{
                    FinishView(vm: vm)
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

struct HitIt: View {
    @StateObject var vm : ViewModel
    var toTutorial : () -> Void
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
            Spacer()
            Button(action :{
                toTutorial()
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

struct Tutorial: View {
    @StateObject var vm : ViewModel
    var onFinish:()->Void
    @State var letsStart = false
    @State var finishPlaying = false
    var body: some View {
        VStack{
            Text("Play On! 🎰")
                .font(customMontFont(size: 35))
                .foregroundStyle(fontColor)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                .padding()
            
            HStack (alignment : .center){
                
                Button(action :{
                    DemoSoundManager.instance.playDemoSong()
                }){
                    Text("Listen!")
                        .font(customMontFont(size: 15))
                        .padding()
                }
                .frame(width: 100)
                .background(BaseButtonColor)
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
                
                
                Text("to what part we will play!")
                    .font(customMontFont(size: 25))
                    .foregroundStyle(fontColor)
                    .padding([.leading],5)
                    
            }
            .frame(maxWidth:.infinity)
            .padding()
            HStack{
                
                Text("When you are ready! Let's")
                    .font(customMontFont(size: 25))
                    .foregroundStyle(fontColor)
                    
                
                Button(action :{
                    vm.currIndex = 0
                    letsStart = true
                    vm.highSweetPotato()
                    finishPlaying = false
                }){
                    Text("Begin!")
                        .font(customMontFont(size: 15))
                        .padding()
                }
                .frame(width: 100)
                .background(BaseButtonColor)
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
                
                    
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
            .padding()
            
            ZStack{
                Rectangle()
                    .foregroundStyle(BaseColor)
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)))
                    .frame(maxHeight: 200)
                if letsStart {
                    if vm.currIndex < vm.tutorialArray.count-1 {
                        if vm.currIndex > 0 {
                            Text("\(vm.tutorialArray[vm.currIndex-1])")
                                .font(customMontFont(size: 23))
                                .foregroundStyle(fontColor)
                                .opacity(0.6)
                                .animation(.easeInOut, value: vm.currIndex)
                                .offset(x : -160)
                                .multilineTextAlignment(.center)
                        }
                    }
                    if vm.currIndex < vm.tutorialArray.count{
                        Text("\(vm.tutorialArray[vm.currIndex])")
                            .font(customMontFont(size: 27))
                            .foregroundStyle(fontColor)
                            .animation(.easeIn, value: vm.currIndex)
                            .multilineTextAlignment(.center)
                    }
                    else {
                        Text("Completed!")
                            .font(customMontFont(size: 27))
                            .foregroundStyle(fontColor)
                            .animation(.easeIn, value: vm.currIndex)
                            .onAppear{
                                finishPlaying = true
                            }
                        
                    }
                    
                    if vm.currIndex < vm.tutorialArray.count-1 {
                        Text("\(vm.tutorialArray[vm.currIndex+1])")
                            .font(customMontFont(size: 23))
                            .foregroundStyle(fontColor)
                            .opacity(0.6)
                            .animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/, value: vm.currIndex)
                            .offset(x : 160)
                            .multilineTextAlignment(.center)
                    }
                }
                else
                {
                    VStack{
                        Text("Hit Begin!")
                            .font(customMontFont(size: 27))
                            .foregroundStyle(fontColor)
                            .animation(.easeIn, value: vm.currIndex)
                        Text("You can always restart by pressing the begin button")
                            .font(customMontFont(size: 16))
                            .foregroundStyle(fontColor)
                            .animation(.easeIn, value: vm.currIndex)
                        
                    }
                }
            }
            Spacer()
            Text(finishPlaying ? "Congrats!, Now you can become a Veggie Master!" : "Look at the text showing the beat, It shows the section below that the name of effect. Gook Luck!")
                .font(customMontFont(size: 16))
                .foregroundStyle(fontColor)
                .animation(.easeIn, value: finishPlaying)
                .multilineTextAlignment(.center)
            Spacer()
            
            Button(action :{
               onFinish()
                vm.resetAll()
            }){
                Text("Next!")
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
}

struct FinishView: View {
    @StateObject var vm : ViewModel
    var body: some View {
        Text("Hello! ✌🏼")
            .font(customMontFont(size: 27))
            .foregroundStyle(fontColor)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
            .padding()
        Text("This is Archit, Thank you for keeping up till here!\n\nI hope yo liked this project of mine and will select me as a Winner! 🪇\n\nAnd wiil make me groove on a beat form VeggieMix!\n\nThank You!")
            .font(customMontFont(size: 17))
            .foregroundStyle(fontColor)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
            .padding()
        Button(action :{
            vm.showOvelay = false
        }){
            Text("Finish!")
                .font(customMontFont(size: 15))
                .padding()
        }
        .frame(width: 100)
        .background(BaseButtonColor)
        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .trailing)
    }
}

#Preview {
    Demo(vm : ViewModel())
}


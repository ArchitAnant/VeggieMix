//
//  AudioVisualiser.swift
//  VeggieMix
//
//  Created by Archit Anant on 02/02/24.
//

import SwiftUI

struct AudioVisualiser: View {
    @State var isPulse = false
    var body: some View{
        ZStack{
//            BasePulse(isPulse: {
//                print("$isPulse")
//                return isPulse ? true : false
//            })
            
            Button(action: {
                isPulse.toggle()
                print(isPulse)
            }){
                Text("Click me!")
                
            }
        }
    }
        
}


struct SinglePulse: View {
    @State var scale1 = 1.0
    @State var scale2: CGFloat = 120
    @State var scale3: CGFloat = 150
    @State var opacity = 1.0
    @State var isPulse:Bool
    
    var body: some View {
        ZStack{
            Circle()
                .foregroundColor(fontColor)
                .frame(width: 100 )
                .scaleEffect(scale1)
                .onAppear{
                    if isPulse{
                        withAnimation(.easeInOut.repeatCount(1, autoreverses: true).speed(0.5)){
                            scale1 += 0.5
                        }
                        
                        
                    }
                }
            Circle()
                .stroke(fontColor,lineWidth:3)
                .frame(width: scale2)
                .opacity(opacity)
            //                .scaleEffect(scale2)
                .onAppear{
                    if isPulse{
                        withAnimation(.easeInOut.speed(0.5)){
                            scale2 += 500
                            opacity -= 1.5
                        }
                    }
                }
            Circle()
                .stroke(fontColor,lineWidth:3)
                .frame(width: scale3)
                .opacity(opacity)
            //                .scaleEffect(scale2)
                .onAppear{
                    if isPulse{
                        withAnimation(.easeInOut.speed(0.5)){
                            scale3 += 500
                            opacity -= 1.5
                        }
                    }
                }
        }
    }
}
struct BasePulse: View {

    @State var isPulse = false
    
    var body: some View {
        
        ZStack{
            Circle()
                .foregroundColor(fontColor)
                .frame(width: 100 )
                .scaleEffect(isPulse ? 1.5 : 1)
                .animation(.easeInOut.speed(0.5).repeatCount(5,autoreverses: true), value: isPulse)
            Circle()
                .stroke(fontColor,lineWidth:3)
                .frame(width: isPulse ? 320 : 200)
                .opacity(isPulse ? 0.2 : 1)

                .animation(.easeInOut.speed(0.6).repeatCount(5,autoreverses: true), value: isPulse)
            Circle()
                .stroke(fontColor,lineWidth:3)
                .frame(width: isPulse ? 650 : 150)
                .opacity(isPulse ? -0.5 : 1)
                .animation(.easeInOut.speed(0.6).repeatCount(5,autoreverses: true), value: isPulse
                )
            Button(action: {
                isPulse.toggle()
                print(isPulse)
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    isPulse.toggle()
                }
            }){
                Text("Click me!")
                
            }
        }
    }
}

#Preview {
//    SinglePulse(isPulse: false)
    BasePulse()
}


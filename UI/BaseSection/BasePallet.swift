//
//  SwiftUIView.swift
//  
//
//  Created by Archit Anant on 16/01/24.
//

import SwiftUI

struct BasePallet: View {
    @StateObject var vm = ViewModel()
    var body: some View {
        VStack{
            HStack{
                VStack{
                    HStack{
                        Text("Let's")
                            .foregroundStyle(Color(red: 0.58, green: 0.74, blue: 0.93))
                            .font(customMontFont(size: 30))
                        
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
                        .font(customMontFont(size: 25))
                        .foregroundColor(fontColor)
                        .padding([.bottom],20)
                        .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
                    HStack{
                        SingleItem(baseIcon: "🎸", baseIntstument: "Guitar"){
                            vm.playGuitarMusic()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                                vm.stopButton()
                            }
                        }
                            .padding([.trailing],10)
                            .background(
                                vm.guitarColor
                                
                            )
                            .clipShape(
                                RoundedRectangle(cornerRadius: 22)
                            )
                        SingleItem(baseIcon: "🎹", baseIntstument: "Piano")
                        {
                            vm.playPianoMusic()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                                vm.stopButton()
                            }
                            
                        }
                            .padding([.trailing],10)
                            .background(
                                vm.pianoColor
                            )
                            .clipShape(
                                RoundedRectangle(cornerRadius: 22)
                            )
                        
                    }
                    HStack{
                        SingleItem(baseIcon: "🥁", baseIntstument: "Drum"){
                            vm.playDrumMusic()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                                vm.stopButton()
                            }
                        }
                            .padding([.trailing],10)
                            .background(
                                vm.drumColor
                            )
                            .clipShape(
                                RoundedRectangle(cornerRadius: 22)
                            )
                        stopAll(){
//                            print(vm.highHitPomelo)
//                            vm.highPomelo()
//                            print(vm.highHitPomelo)
                            vm.stopButton()
                            
                            
//
                        }
//                            .padding([.trailing],10)
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

//
//  SwiftUIView.swift
//  
//
//  Created by Archit Anant on 18/01/24.
//

import SwiftUI

struct VeggieSection: View {
    var genPulse:()->Void
    var body: some View {
        VStack {
            HStack{
                SectionView(width: 300,section: "Biting :", list: ["Apple","Carrot","Slime"]){
                    genPulse()
                }
                SectionView(width:138,section: "Grating :",list: ["Carrot","Pepper"]){
                    genPulse()
                }
            }
            .padding([.bottom],10)
            
            HStack{
                SectionView(width : 300,section: "Stab :", list: ["Cabbage","Carrot","Celery"]){
                    genPulse()
                }
                SectionView(width : 138,section: "Hit :",list: ["Sweet\nPotato","Pemelo"]){
                    genPulse()
                }
            }
        }
    }
}

struct SectionView: View{
    var width : CGFloat
    var section :String
    var list : [String]
    var genPulse:()->Void
    var body: some View{
        ZStack{
            VStack{
                Text(section)
                    .font(customMontFont(size: 24))
                    .foregroundColor(fontColor)
                    .padding([.bottom],20)
                    .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
                HStack{
                    VStack{
                        VeggieButton(veggieName: list[0],section: section){
                            genPulse()
                        }
                            .padding([.bottom],10)
                        VeggieButton(veggieName: list[1],section: section)
                             {
                                genPulse()
                            }
                            
                        
                    }
                    if list.count==3{
                        VeggieButton(veggieName: list[2],section: section){
                            genPulse()
                        }
                            .padding([.leading],10)
                             
                        
                    }
                }
            }
            .frame(minWidth: 0,
                   maxWidth: width,
                   maxHeight: 200
            )
            .padding(30)
            .background(BasePalletColor)
            .cornerRadius(23)
            .padding([.leading],10)
        }
    }
}

#Preview {
    VeggieSection(){
        
    }
}

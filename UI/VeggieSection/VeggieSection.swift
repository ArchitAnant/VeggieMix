//
//  VeggieSection.swift
//  
//
//  Created by Archit Anant on 18/01/24.
//

import SwiftUI

struct VeggieSection: View {
    @StateObject var vm : ViewModel
    var genPulse:()->Void
    var body: some View {
        VStack {
            HStack{
                SectionView(vm : vm , width: 300,section: "Biting :", list: ["Apple","Carrot","Slime"]){
                    
                    genPulse()
                }
                SectionView(vm : vm ,width:138,section: "Grating :",list: ["Pepper","Carrot"]){
                    genPulse()
                }
            }
            .padding([.bottom],10)
            
            HStack{
                SectionView(vm : vm ,width : 300,section: "Stab :", list: ["Carrot","Celery","Cabbage"]){
                    genPulse()
                }
                SectionView(vm : vm ,width : 138,section: "Hit :",list: ["Pomelo","Sweet\nPotato"]){
                    genPulse()
                }
            }
        }
    }
}

struct SectionView: View{
    @StateObject var vm : ViewModel
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
                            if vm.showOvelay {
                                vm.currIndex += 1
                                if vm.currIndex < vm.tutorialArray.count{
                                    switch vm.tutorialArray[vm.currIndex] {
                                    case  "Hit\nSweet Potato" :
                                        vm.highSweetPotato()
                                    case "Stab\nCarrot":
                                        vm.highCarrot()
                                    case "Hit\nPomelo":
                                        vm.highPomelo()
                                    default:
                                        vm.resetAll()
                                    }
                                }
                                else{
                                    vm.resetAll()
                                }
                                
                            }
                        }
                        .overlay{
                            if section == "Hit :"{
                                RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                                    .stroke(vm.highHitPomelo ,lineWidth: 2)
                            }
                            if section == "Grating :"{
                                RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                                    .stroke(vm.highGratePepper ,lineWidth: 2)
                            }
                            if section == "Stab :"{
                                RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                                    .stroke(vm.highStabCarrot ,lineWidth: 2)
                            }
                        }
                            .padding([.bottom],10)
                            
                        VeggieButton(veggieName: list[1],section: section)
                             {
                                genPulse()
                                 if vm.showOvelay {
                                     vm.currIndex += 1
                                     if vm.currIndex < vm.tutorialArray.count{
                                         switch vm.tutorialArray[vm.currIndex] {
                                         case  "Hit\nSweet Potato" :
                                             vm.highSweetPotato()
                                         case "Stab\nCarrot":
                                             vm.highCarrot()
                                         case "Hit\nPomelo":
                                             vm.highPomelo()
                                         default:
                                             vm.resetAll()
                                         }
                                     }
                                     else{
                                         vm.resetAll()
                                     }
                                 }
                             }
                            .overlay{
                                if section == "Hit :"{
                                    RoundedRectangle(cornerSize:CGSize(width: 20, height: 20))
                                        .stroke(vm.highHitSweetPotato ,lineWidth: 2)
                                }
                            }
                        }
                        if list.count==3{
                            VeggieButton(veggieName: list[2],section: section){
                                genPulse()
                                if vm.showOvelay {
                                    vm.currIndex += 1
                                    if vm.currIndex < vm.tutorialArray.count{
                                        switch vm.tutorialArray[vm.currIndex] {
                                        case  "Hit\nSweet Potato" :
                                            vm.highSweetPotato()
                                        case "Stab\nCarrot":
                                            vm.highCarrot()
                                        case "Hit\nPomelo":
                                            vm.highPomelo()
                                        default:
                                            vm.resetAll()
                                        }
                                    }
                                    else{
                                        vm.resetAll()
                                    }
                                }
                            }.overlay{
                                    if section == "Stab :"{
                                        RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                                                .stroke(vm.highStabCabbage ,lineWidth: 2)
                                    }
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
    VeggieSection(vm : ViewModel()){
        
    }
}

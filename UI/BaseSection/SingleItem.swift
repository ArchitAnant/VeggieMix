//
//  SwiftUIView.swift
//  
//
//  Created by Archit Anant on 16/01/24.
//
import SwiftUI

struct SingleItem : View{
    var baseIcon:String
    var baseIntstument:String
    var onclick:()->Void
    
    @State var buttonPressed = false
//    @State var buttonColor = BaseColor
    
    
    var body:some View{
        Button(action: {
            onclick()
        }){
            HStack{
                Text(baseIcon)
                    .font(customMontFont(size: 35))
                    .padding([.trailing],7)
                Text(baseIntstument)
                    .font(customMontFont(size: 20))
                    .foregroundColor(fontColor)
                
            }
            .frame(width: 196.56088, height: 87)
            
        }
    }
        
}


struct stopAll: View {
    var onClick:()->Void
    var body: some View {
        Button(action: {
            onClick()
        }){
            HStack{
                Image(systemName: "stop.fill")
                    .foregroundStyle(fontColor)
                    .padding([.trailing],7)
                Text("Stop All!")
                    .font(customMontFont(size: 20))
                    .foregroundColor(fontColor)
                
            }
            .frame(width: 196.56088, height: 87)
            
        }
    .background(
        BaseButtonColor
    )
    .clipShape(
        RoundedRectangle(cornerRadius: 22)
    )
    }
}


#Preview {
    SingleItem(baseIcon: "🎸", baseIntstument: "Guitar"){
        
    }
}

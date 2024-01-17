//
//  SwiftUIView.swift
//  
//
//  Created by Archit Anant on 18/01/24.
//

import SwiftUI

struct VeggieButton: View {
    var veggieName : String
    
    var body: some View {
        Button(action: {
            
        }){
            Text(veggieName)
                    .font(Font.custom("Andale Mono", size: 20))
                    .foregroundColor(fontColor)
                    .frame(width: 135.68636, height: 72)
            
            
            
        }
        .background(
            BaseColor
        )
        .clipShape(
            RoundedRectangle(cornerRadius: 16)
        )
    }
    
}

#Preview {
    VeggieButton(veggieName: "Apple")
}

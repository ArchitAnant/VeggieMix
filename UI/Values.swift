//
//  Values.swift
//  VeggieMix
//
//  Created by Archit Anant on 16/01/24.
//

import SwiftUI

let BaseButtonColor  = Color(red: 0.37, green: 0.52, blue: 0.7)

let BaseColor = Color(red: 0.050980392156862744, green: 0.10588235294117647, blue: 0.16862745098039217)

let BasePalletColor = Color(red: 0.06, green: 0.14, blue: 0.24)

let fontColor = Color(red: 0.37, green: 0.52, blue: 0.7)

func customMontFont(size:CGFloat) ->Font{
    
    let cfURL = Bundle.main.url(forResource: "MontserratAlternates-Medium", withExtension: "ttf")! as CFURL
    CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil)
   
    return Font.custom("MontserratAlternates-Medium",size: size)
}

// MonoFont

//
//  Values.swift
//  VeggieMix
//
//  Created by Archit Anant on 16/01/24.
//

import SwiftUI

let BaseButtonColor  = Color(red: 0.050980392156862744, green: 0.10588235294117647, blue: 0.16862745098039217)

let BaseColor = Color(red: 0.050980392156862744, green: 0.10588235294117647, blue: 0.16862745098039217)

let BasePalletColor = Color(red: 0.054901960784313725, green: 0.1411764705882353, blue: 0.23921568627450981)

let fontColor = Color(red: 0.37254901960784315, green: 0.5215686274509804, blue: 0.6941176470588235)

let overlayColor = Color(red: 0.027450980392156862, green: 0.054901960784313725, blue: 0.09019607843137255)

func customMontFont(size:CGFloat) ->Font{
    
    let cfURL = Bundle.main.url(forResource: "MontserratAlternates-Medium", withExtension: "ttf")! as CFURL
    CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil)
   
    return Font.custom("MontserratAlternates-Medium",size: size)
}

// MonoFont

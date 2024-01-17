//
//  Values.swift
//  VeggieMix
//
//  Created by Archit Anant on 16/01/24.
//

import SwiftUI

let BaseButtonColor  = Color(red: 0.37, green: 0.52, blue: 0.7)

let BaseColor = Color(red: 0.05, green: 0.1, blue: 0.17)

let BasePalletColor = Color(red: 0.06, green: 0.14, blue: 0.24)

let fontColor = Color(red: 0.37, green: 0.52, blue: 0.7)

func customMonoFont(size:CGFloat) ->Font{
    let cfURL = Bundle.main.url(forResource: "MonoFont", withExtension: "ttf")! as CFURL
    CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil)
   

    return Font.custom("MonoFont",size: size)
}

// MonoFont

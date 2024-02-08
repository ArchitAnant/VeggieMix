//
//  PlayerPage 2.swift
//
//
//  Created by Archit Anant on 08/02/24.
//

import SwiftUI
import AVKit

struct PlayerPage: View {
    @StateObject var vm : ViewModel
    var body: some View {
        let url = Bundle.main.url(forResource: "VeggieMixDemo", withExtension: ".mp4")
         let player = AVPlayer(url: url!)
         VideoPlayer(player: player)
            .frame(maxWidth: .infinity,maxHeight: 290)
             .disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
             .onAppear{
         }
             .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)))
     
    }
    
}

#Preview {
    PlayerPage(vm : ViewModel())
}

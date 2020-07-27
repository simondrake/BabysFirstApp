//
//  AlphabetGame.swift
//  Babys First App
//
//  Created by Simon Drake on 26/07/2020.
//  Copyright © 2020 Simon Drake. All rights reserved.
//

import SwiftUI

struct AlphabetGame: View {
    @State var play = 0
    
    var body: some View {
       VStack{
            LottieView(name: "confetti", play: $play)
                .frame(width:100, height:100)
            Button("Play"){ self.play += 1 }
        }
    }
}

struct AlphabetGame_Previews: PreviewProvider {
    static var previews: some View {
        AlphabetGame()
    }
}

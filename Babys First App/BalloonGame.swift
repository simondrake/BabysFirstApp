//
//  BalloonGame.swift
//  Babys First App
//
//  Created by Simon Drake on 20/07/2020.
//  Copyright © 2020 Simon Drake. All rights reserved.
//

import SwiftUI
import Lottie

struct Balloon: Identifiable {
    var id = UUID()
    var color: String
    var position: CGPoint
}

struct Confetti: Identifiable {
    var id = UUID()
    var position: CGPoint
}

struct BalloonGame: View {
    @State private var balloons = [Balloon]()
//    @State private var confetti = [Confetti]()
    
    @State private var confetti = Confetti(position: CGPoint(x: 0, y: 0))
    @State private var showConfetti = false
    @State var play = 0
    
    var count = 10
    var colors: [String] = ["red", "blue", "yellow", "green"]
    var maxWidth = UIScreen.main.bounds.size.width
    var maxHeight = UIScreen.main.bounds.size.height
    var offset: CGFloat = 10
    
    var body: some View {
        ZStack {
            ForEach(self.balloons.indices, id: \.self) { ix in
                Image("balloon-" + self.balloons[ix].color)
                   .resizable()
                   .frame(width: 100, height: 100)
                    .position(self.balloons[ix].position)
                    .onTapGesture {
                        self.confetti.position = self.balloons[ix].position
                        self.showConfetti = true
                        self.play += 1 
                        
//                        self.confetti.append(Confetti(
//                            position: self.balloons[ix].position
//                        ))
                        
                        self.balloons.remove(at: ix)
                    }
            }
            
            if self.showConfetti {
                LottieView(name: "confetti", play: $play)
                .frame(width: 200, height: 200)
                .position(self.confetti.position)
            }
            

            
//            ForEach(self.confetti.indices, id: \.self) { ix in
////                return self.showConfetti(index: ix)
//                LottieView(name: "confetti")
//                .frame(width: 200, height: 200)
//                .position(self.confetti[ix].position)
//                .animation(.easeOut)
//                .onAppear {
//                    print("Confetti has appeared")
//                }
//                .onDisappear {
//                    print("Confetti has disappeared")
//                }
//            }
        }.onAppear {
            for _ in 0...self.count {
                let b = Balloon(
                    color: self.colors.randomElement()!,
                    position: CGPoint(
                        x: .random(in: self.offset...self.maxWidth-self.offset),
                        y: .random(in: self.offset...self.maxWidth-self.offset)
                    )
                )

                self.balloons.append(b)
            }
        }
    }
    
    
//    Rectangle()
//    .fill(Color.red)
//    .frame(width: 200, height: 200)
    
}

struct BalloonGame_Previews: PreviewProvider {
    static var previews: some View {
        BalloonGame()
    }
}

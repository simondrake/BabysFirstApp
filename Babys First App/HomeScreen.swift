//
//  HomeScreen.swift
//  Babys First App
//
//  Created by Simon Drake on 20/07/2020.
//  Copyright © 2020 Simon Drake. All rights reserved.
//

import SwiftUI

let title = "Babys First App"
let titleArr = title.split(separator: " ")

struct HomeScreen: View {
    var body: some View {
        VStack {
            HStack {
                ForEach(0..<titleArr.count, id: \.self) { i in
                    Text(titleArr[i])
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(i.isMultiple(of: 2) ? .blue : .red)
                }
            }
            
            Spacer()
            
            Image("balloon-red")
            .resizable()
            .scaledToFit()
            .frame(width: 75, height: 75)
            
            Spacer()
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}

//
//  ContentView.swift
//  Animations
//
//  Created by Mayur on 20/07/24.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 1.0
    @State private var animationAmount2 = 1.0
    @State private var animationAmount3 = 0.0
    var body: some View {
        VStack{
            Spacer()
            Spacer()
            Button("Tap Me") {
                withAnimation(.spring(duration: 1, bounce: 0.5)){
                    animationAmount3 += 360
                }
            }
            .padding(40)
            .background(.red)
            .foregroundStyle(.white)
            .clipShape(.circle)
            .rotation3DEffect(.degrees(animationAmount3),axis: /*@START_MENU_TOKEN@*/(x: 0.0, y: 1.0, z: 0.0)/*@END_MENU_TOKEN@*/
            )
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            Stepper("scale amount", value: $animationAmount2.animation(
                .easeInOut(duration: 0.5)
                .repeatCount(3, autoreverses: true)
            ), in: 1...2)
            .padding(20)
            Spacer()
            Spacer()
            Button("Tap Stepper") {
                animationAmount2 += 1
            }
            .padding(40)
            .background(.red)
            .foregroundStyle(.white)
            .clipShape(.circle)
            .scaleEffect(animationAmount2)
            ForEach(1..<16){_ in
                Spacer()
            }
            Spacer()
            Button("Tap me"){
                animationAmount = 2
            }
            .padding(50)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(.circle)
            .overlay(
                Circle()
                    .stroke(.red)
                    .scaleEffect(animationAmount)
                    .opacity(2 - animationAmount)
                    .animation(
                        .easeOut(duration: 1)
                        .repeatForever(autoreverses: false),
                        value: animationAmount
                    )
            )
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}

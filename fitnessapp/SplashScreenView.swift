//
//  SplashScreenView.swift
//  fitnessapp
//
//  Created by Gabriel Ciaburri on 5/22/24.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var scale = 0.7
    @Binding var isActive: Bool
    
    var body: some View {
        VStack {
            VStack {
                Image(systemName: "scribble.variable")
                    .font(.system(size: 100))
                    .foregroundColor(.blue)
                Text("Scribble App")
                    .font(.system(size: 20))
            }.scaleEffect(scale)
            .onAppear{
                withAnimation(.easeIn(duration: 0.7)) {
                    self.scale = 0.9
                }
            }
        }.onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

//#Preview {
//    SplashScreenView(isActive: )
//}

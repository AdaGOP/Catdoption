//
//  CircleAnimationView.swift
//  cadoptio
//
//  Created by khoirunnisa' rizky noor fatimah on 22/04/24.
//

import SwiftUI

struct CircleAnimationView: View {
    @State var currentOpacity = 0.1
    
    var body: some View{
//        BouncingCircleView()
        Circle()
            .opacity(currentOpacity)
            .animation(
                .easeInOut(duration: 2.0),
                value: currentOpacity
            )
            .onTapGesture {
//                withAnimation(.easeInOut(duration: 2.0)) {
                    currentOpacity = 1
//                }
            }
    }
}

#Preview {
    CircleAnimationView()
}


struct BouncingCircleView: View {
    @State private var position: CGFloat = 50
    @State private var direction: CGFloat = 1
    let animationDuration: Double = 1.0
    
    var body: some View {
        Circle()
            .frame(width: 50, height: 50)
            .foregroundColor(.blue)
            .offset(x: 0, y: position)
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: self.animationDuration, repeats: true) { _ in
                    withAnimation(.easeInOut(duration: self.animationDuration)) {
                        self.position += 100 * self.direction
                        self.direction *= -1
                    }
                }
            }
    }
}

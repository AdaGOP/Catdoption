//
//  SpinnerView.swift
//  cadoptio
//
//  Created by khoirunnisa' rizky noor fatimah on 22/04/24.
//

import SwiftUI

struct SpinnerView: View {
    
    @State var currentIndex: Int = 0
    @State var currentOffset = CGSize.zero
    
    let numberOfLeaves = 8
    
    var body: some View{
        ZStack{
            ForEach(0 ..< numberOfLeaves, id: \.self){ index in
                Leaf(
                    rotation: Angle.degrees( Double(index) / Double(numberOfLeaves) * 360.0 ),
                    isCurrent: index == currentIndex)
            }
            Text("🤚")
        }
        .offset(currentOffset)
        .gesture(
            DragGesture()
                .onChanged({ gesture in
                    currentOffset = gesture.translation
                })
                .onEnded({ gesture in
                    withAnimation(.easeIn) {
                            currentOffset = .zero
                    }

                })
        )
        .onAppear(perform: {
            Timer.scheduledTimer(withTimeInterval: 0.15, repeats: true) { timer in
                if currentIndex < numberOfLeaves{
                    currentIndex += 1
                }else{
                    currentIndex = 0
                }
            }
        })

    }
}

#Preview {
    SpinnerView()
}

struct Leaf: View {
    
    let rotation: Angle
    let isCurrent: Bool
    
    var body: some View{
        ZStack{
            Capsule()
                .trim(
                    from: isCurrent ?   0.2 : 0,
                    to: isCurrent ?    0 : 1)
                .stroke(isCurrent ? Color.red : Color.gray, lineWidth: 5)
                .offset(x: isCurrent ? 5 : 0, y: isCurrent ? 10 : 70)
                .scaleEffect(
                    CGSize(
                        width: isCurrent ? 1 : 0.7,
                        height: isCurrent ? 1 : 0.7),
                    anchor: .center)
                .opacity( isCurrent ? 0 : 1)
                .foregroundColor(.white)
                .frame(width: 20, height: 50, alignment: .center)
                .rotationEffect(rotation, anchor: .center)
                .animation(
                    .easeIn
                        .speed(1)
                    ,
                    value: isCurrent)
            
            Capsule()
                .trim(
                    from: isCurrent ? 0 : 0.2,
                    to: isCurrent ? 1: 0)
                .stroke(isCurrent ? Color.red : Color.gray, lineWidth: 5)
                .offset(x: isCurrent ? 5 : 0, y: isCurrent ? 10 : 70)
                .scaleEffect(
                    CGSize(
                        width: isCurrent ? 1 : 0.7,
                        height: isCurrent ? 1 : 0.7),
                    anchor: .center)
                .opacity( isCurrent ? 0 : 1)
                .foregroundColor(.white)
                .frame(width: 20, height: 50, alignment: .center)
                .rotationEffect(rotation, anchor: .center)
                .animation(
                    .easeIn
                        .speed(1)
                    ,
                    value: isCurrent)
        }
    }
}


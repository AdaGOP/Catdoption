//
//  PetDetailView.swift
//  cadoptio
//
//  Created by khoirunnisa' rizky noor fatimah on 19/04/24.
//

import SwiftUI
import CoreHaptics

struct PetDetailView: View {
    
    var pet: PetModel
    @State var engine: CHHapticEngine?
    
    @State var showingSheet: Bool = false
    @State var opacity: Double = 1.0
    @State var isFavorite: Bool = false
    @State var loveIcon: String = "heart"
    @State var isLoveAppear: Bool = false
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 0){
                
                Image(pet.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .ignoresSafeArea()
                Text(pet.name)
                    .padding([.leading, .top])
                    .font(.largeTitle)
                    .bold()
                Text("Persian cat - 3 years old")
                    .foregroundStyle(.gray)
                    .padding(.leading)
                
                HStack{
                    PetInfoView()
                    PetInfoView()
                    PetInfoView()
                }
                .padding()
                
                PetOwnerView()
                
                Button {
                    showingSheet.toggle()
                } label: {
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundStyle(.orange)
                        .frame(width: 358, height: 50)
                        .overlay( Text("Request to adopt")
                            .foregroundStyle(.white))
                }
                .sheet(isPresented: $showingSheet, content: {
                    SpinnerView()
                })
                .padding()
                Spacer()
            }
            
            if isLoveAppear {
                LoveView(isLoveAppear: $isLoveAppear)
            }
            
        }
        .toolbar {
            Button(action: {
                print("tap")
                isFavorite.toggle()
                isLoveAppear = isFavorite
                withAnimation {
                    complexSuccess()
                    loveIcon = isFavorite ? "heart.fill" : "heart"
                }
            }) {
                Image(systemName: loveIcon)
                    .resizable()
                    .frame(width: 35, height: 34)
                    .foregroundColor(.white)
                
            }
            .symbolEffect(.pulse, value: isFavorite)
//            .simultaneousGesture(LongPressGesture().onEnded { _ in
//                isFavorite.toggle()
//                isLoveAppear = isFavorite
//                withAnimation {
//                    complexSuccess()
//                    loveIcon = isFavorite ? "heart.fill" : "heart"
//                }
//            })
            .sensoryFeedback(.success, trigger: isFavorite)
            .onAppear{
                prepareHaptics()
            }
        }
    }
    
    func prepareHaptics() {
        
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        
        do {
            engine = try CHHapticEngine()
            try engine?.start()
        } catch {
            print("There was an error creating the engine: \(error.localizedDescription)")
        }
    }
    
    func complexSuccess() {
        // make sure that the device supports haptics
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        var events = [CHHapticEvent]()
        
        // create one intense, sharp tap
        //        let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1)
        //        let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 1)
        //        let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 0)
        //        events.append(event)
        for i in stride(from: 0, to: 1, by: 0.1) {
            let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(i))
            let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(i))
            let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: i)
            events.append(event)
        }
        
        for i in stride(from: 0, to: 1, by: 0.1) {
            let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(1 - i))
            let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(1 - i))
            let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 1 + i)
            events.append(event)
        }
        
        // convert those events into a pattern and play it immediately
        do {
            let pattern = try CHHapticPattern(events: events, parameters: [])
            let player = try engine?.makePlayer(with: pattern)
            try player?.start(atTime: 0)
        } catch {
            print("Failed to play pattern: \(error.localizedDescription).")
        }
    }
    
}

#Preview {
    PetDetailView(pet: PetModel(name: "Butet", breed: "Domestic", distance: 1, weight: "3 kg", gender: "Female", imageName: "Butet"))
}

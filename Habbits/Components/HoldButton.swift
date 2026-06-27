//
//  HoldButton.swift
//  Habbits
//
//  Created by Przemek Hussar on 12/06/2026.
//

import SwiftUI

struct HoldButton: View {
    
    @Binding var pulse: Bool
    @Binding var isPressed : Bool
    let activity: Activity?
    
    var start: () -> Void
    
    var onTap : () -> Void
    
    
    var body: some View {
        ZStack{
            ZStack{
                Circle()
                    .frame(width: 265, height: 265)
                    .foregroundStyle(.white)
                    .scaleEffect(pulse ? 1.05 : 1.0)
                    .animation(
                        pulse
                        ? .easeInOut(duration: 1.5).repeatForever(autoreverses: true)
                        : .easeInOut(duration: 0.3),
                        value: pulse
                    )
                    .scaleEffect(isPressed ? 1.13 : 1.0)
                    .animation(.easeInOut(duration: 2.0), value: isPressed)
                    .onAppear { pulse = true }
                    .onLongPressGesture(minimumDuration: 2.0) {
                        guard activity == nil else { return }
                        start()
                        isPressed = false
                        pulse = true
                    } onPressingChanged: { state in
                        guard activity == nil else { return }
                        isPressed = state
                        pulse = !state
                    }
                    .onTapGesture {
                        guard activity != nil else { return }
                        onTap()
                    }
                Circle()
                    .fill(LinearGradient(
                        colors: [.pink.opacity(0.35), .blue.opacity(0.3)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ))
                    .frame(width: 265, height: 265)
                    .scaleEffect(isPressed ? 1.15 : 0.001)
                    .animation(.easeInOut(duration: 2.0), value: isPressed)
            }
            
            VStack {
                if !isPressed {
                    if let activity {
                        
                        VStack(spacing: 10){
                            Text(activity.name)
                                .font(.title2)
                            
                            TimelineView(.periodic(from: .now, by: 1.0)) { _ in
                                Text(activity.formattedTotal)
                                    .contentTransition(.numericText())
                                    .animation(.snappy, value: Int(activity.totalDuration))
                            }
                            .font(.system(size: 28, weight: .bold, design: .monospaced))
                            .foregroundStyle(.blue)
                            
                        }.transition(.asymmetric(
                            insertion: .opacity.animation(.easeOut(duration: 0.3).delay(2.0)),
                            removal: .opacity.animation(.easeOut(duration: 0.3))
                        ))
                        
                        
                        
                        
                    } else {
                        Text("Hold to Start")
                            .font(.title3)
                            .transition(.asymmetric(
                                insertion: .opacity.animation(.easeOut(duration: 0.3).delay(1.0)),
                                removal: .opacity.animation(.easeOut(duration: 0.3))
                            ))
                    }
                }
            }
        }.shadow(color: .gray.opacity(0.2),radius: 10)
        
    }
}

#Preview {
    @Previewable @State var pulse = false
    @Previewable @State var isPressed = false
    
    let testActivity = Activity(name: "Naprawić przycisk")
    
    HoldButton(
        pulse: $pulse,
        isPressed: $isPressed,
        activity: testActivity,
        start: { print("started!")},
        onTap: {print("tap")}
    )
}

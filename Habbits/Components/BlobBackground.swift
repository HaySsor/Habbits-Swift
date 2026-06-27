//
//  BlobBackground.swift
//  Habbits
//
//  Created by Przemek Hussar on 12/06/2026.
//

import SwiftUI

struct BlobBackground: View {
    var body: some View {
        Circle()
            .fill(LinearGradient(
                colors: [.pink.opacity(0.35), .blue.opacity(0.3)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            ))
            .frame(width: 500, height: 500)
            .blur(radius: 80)
            .offset(x: -100, y: -300)
            .ignoresSafeArea()
            .allowsHitTesting(false)
        
        Circle()
            .fill(LinearGradient(
                colors: [.pink.opacity(0.35), .blue.opacity(0.3)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            ))
            .frame(width: 500, height: 500)
            .blur(radius: 80)
            .offset(x: 100, y: 300)
            .ignoresSafeArea()
            .allowsHitTesting(false)
    }
}

#Preview {
    BlobBackground()
}

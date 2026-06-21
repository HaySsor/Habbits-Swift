//
//  ConfirmButton.swift
//  Habbits
//
//  Created by Przemek Hussar on 21/06/2026.
//

import SwiftUI

struct ConfirmButton: View {

    var icon: String
    var iconColor: Color
    var title: String
    var description: String
    var tapFunction: () -> Void

    var body: some View {
        HStack(spacing: 10) {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 50, height: 50)
                .foregroundColor(iconColor.opacity(0.2))
                .overlay {
                    Image(systemName: icon)
                        .foregroundStyle(iconColor)
                        .font(.title2)
                }

            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                Text(description)
                    .font(.footnote)
                    .foregroundStyle(.gray)
            }

            Spacer()
        }
        .padding()
        .background(.gray.opacity(0.1), in: .rect(cornerRadius: 12))
        .overlay {
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .stroke(.gray.opacity(0.2), lineWidth: 1)
        }
        .onTapGesture {
            tapFunction()
        }
    }
}

#Preview {
    ConfirmButton(
        icon: "pause",
        iconColor: .blue,
        title: "Pause",
        description: "return to this task later",
        tapFunction: {}
    )
}

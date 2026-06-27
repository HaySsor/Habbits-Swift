//
//  ConfirmSheet.swift
//  Habbits
//
//  Created by Przemek Hussar on 21/06/2026.
//

import SwiftUI

struct ConfirmSheet: View {

    var pauseSession: () -> Void
    var finishSession: () -> Void
    var toggleSheet: () -> Void

    var body: some View {
        VStack(spacing: 20) {
            VStack {
                Text("End session")
                    .font(.title2)
                Text("Sure you want to stop?")
                    .font(.callout)
                    .foregroundStyle(.gray)
            }

            VStack(spacing: 10) {
                ConfirmButton(
                    icon: "pause",
                    iconColor: .blue,
                    title: "Pause",
                    description: "return to this task later",
                    tapFunction: {
                        pauseSession()
                        toggleSheet()
                    }
                )

                ConfirmButton(
                    icon: "checkmark",
                    iconColor: .green,
                    title: "Done",
                    description: "Mark this task as done",
                    tapFunction: {
                        finishSession()
                        toggleSheet()
                    }
                )
                
                Button("Cancel") {
                    toggleSheet()
                }.padding(.top, 20)
                    .buttonStyle(.plain)
            }
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    ConfirmSheet(pauseSession: {}, finishSession: {}, toggleSheet: {})
}

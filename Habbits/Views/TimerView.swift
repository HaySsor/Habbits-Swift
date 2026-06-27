//
//  TimerView.swift
//  Habbits
//
//  Created by Przemek Hussar on 11/06/2026.
//

import SwiftUI
import SwiftData

struct TimerView: View {
    @Query var activities : [Activity]
    
    @Environment(\.modelContext) private var modelContext
    
    var activeActivity: Activity? {
        activities.first { $0.isActive }
    }
    var inactiveActivities: [Activity] {
        activities.filter { !$0.isActive }
    }
    
    @State private var taskName: String = ""
    @State private var pulse: Bool = false
    @State private var isPressed: Bool = false
    @State private var showSheet: Bool = false
    
    
    func start(){
        guard !taskName.trimmingCharacters(in: .whitespaces).isEmpty else { return }
        
        let activity :Activity = Activity(name: taskName)
        let session: Session = Session(startedAt: .now)
        
        activity.sessions.append(session)
        modelContext.insert(activity)
        taskName = ""
        
    }
    
    func toggleSheet() {
        showSheet.toggle()
    }
    
    private func closeActiveSession() {
        activeActivity?.sessions.first(where: { $0.endedAt == nil })?.endedAt = .now
    }

    func pauseSession() {
        closeActiveSession()
    }

    func finishSession() {
        closeActiveSession()
        activeActivity?.status = .done
    }
    
    
    var body: some View {
        VStack(spacing: 50) {
            TextField("What are you doing?", text: $taskName)
                .multilineTextAlignment(.center)
                .textFieldStyle(.plain)
                .font(.title2)
                .padding()
                .overlay {
                    RoundedRectangle(cornerRadius: 50, style: .continuous)
                        .stroke(.gray.opacity(0.3), lineWidth: 1)
                }
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                .disabled(activeActivity != nil)
            HoldButton(
                pulse: $pulse,
                isPressed: $isPressed,
                activity: activeActivity,
                start: start,
                onTap: toggleSheet
            )
           
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background {
            BlobBackground()
                .opacity(0.6)
        }.sheet(isPresented: $showSheet) {
            ConfirmSheet(pauseSession: pauseSession, finishSession: finishSession, toggleSheet: toggleSheet)
                .presentationDetents([.fraction(0.43)])
                .presentationDragIndicator(.visible)
                .padding(.top, 20)
        }
        
    }
}

#Preview {
    TimerView()
        .modelContainer(for: [Activity.self, Session.self], inMemory: true)
}

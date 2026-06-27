//
//  Activity.swift
//  Habbits
//
//  Created by Przemek Hussar on 11/06/2026.
//

import Foundation
import SwiftData


@Model final class Activity{
    @Relationship(deleteRule:.cascade, inverse: \Session.activity)
    var sessions: [Session]
    
    var name: String
    var status: ActivityStatus
    var createdAt: Date
     
    
    var totalDuration: TimeInterval {
        sessions.reduce(0) { $0 + $1.duration }
    }
    
    var formattedTotal :String {
        Duration.seconds(totalDuration).formatted(.time(pattern: .hourMinuteSecond))
    }
    
    var isActive: Bool {
        sessions.contains { $0.endedAt == nil }
    }
    
    init(name: String, status: ActivityStatus = .pending, createdAt: Date = .now, sessions: [Session] = []) {
        self.name = name
        self.status = status
        self.createdAt = createdAt
        self.sessions = sessions
    }
}

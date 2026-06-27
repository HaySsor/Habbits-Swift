//
//  Session.swift
//  Habbits
//
//  Created by Przemek Hussar on 11/06/2026.
//

import Foundation
import SwiftData


@Model final class Session {
   var startedAt : Date
   var endedAt : Date?
   var activity : Activity?
    
    var duration: TimeInterval {
        (endedAt ?? Date()).timeIntervalSince(startedAt)
    }
    
    init(startedAt:Date = .now, endedAt: Date? = nil){
        self.startedAt = startedAt
        self.endedAt = endedAt
    }
}

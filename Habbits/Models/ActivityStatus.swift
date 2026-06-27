//
//  ActivityStatus.swift
//  Habbits
//
//  Created by Przemek Hussar on 11/06/2026.
//

import Foundation


enum ActivityStatus : String,Codable, CaseIterable {
    case pending
    case done
    
    var label :String {
        switch self {
        case .done: return "Done"
        case .pending: return "Paused"
        }
    }
}

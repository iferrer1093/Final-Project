//
//  Developer.swift
//  Final App
//
//  Created by FERRER, ISAAC on 5/4/26.
//

import Foundation

enum Developer: String, CaseIterable, Identifiable {
    case name, age, degree, image
    
    var id: String {self.rawValue}
    
    
    
    var info: String {
        switch self {
        case .name: return "Isaac Ferrer"
        case .age: return "18"
        case .degree: return "Pursuing CIS Degree"
        case .image: return ("Picture")
        }
    }
    
}

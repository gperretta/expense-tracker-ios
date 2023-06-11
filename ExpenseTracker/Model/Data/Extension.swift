//
//  Extension.swift
//  ExpenseTracker
//
//  Created by Gilda on 04/01/23.
//

import Foundation
import SwiftUI

// just for convenience
extension Color {
    
    static let background = Color("background")
    static let icon = Color("icon")
    static let text = Color("text")
    
    static let systemBackground = Color(uiColor: .systemBackground)
}

// MARK: to format the Date 
extension DateFormatter {
    
    static let allNumericUSA : DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        
        return formatter
    }()
}

extension String {
    
    /// date input: String type -> we parse it to have a date output: Date type
    func dateParsed() -> Date {
        guard let parsedDate = DateFormatter.allNumericUSA.date(from: self) // we extended DateFormatter
        else { return Date() }
        
        return parsedDate
    }
}

extension Date {
    
    func formatted() -> String {
        
        return self.formatted(.dateTime.year().month().day())
    }
}

// round double numbers to 2 digits
extension Double {
    
    func roundedNumber() -> Double {
        return (self * 100).rounded() / 100
    }
}

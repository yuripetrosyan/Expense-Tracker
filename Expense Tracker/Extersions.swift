//
//  Extersions.swift
//  Expense Tracker
//
//  Created by Yuri Petrosyan on 8/20/24.
//

import Foundation
import SwiftUI


extension DateFormatter{
    static let allNumericUSA: DateFormatter = {
        print("Initializing DateFormatter")
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
       
        
        return formatter
    }()
}

extension String{
   func dateParsed() -> Date {
       guard let paredDate = DateFormatter.allNumericUSA.date(from: self) else { return Date()}
       
       return paredDate
    }
}

extension Date: Strideable{
    func formatted() -> String {
        return self.formatted(.dateTime.year().month().day())
    }
}

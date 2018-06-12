//
//  DateExtension.swift
//  ANZTaxCalc
//
//  Created by Tran Quynh Tran on 12/06/18.
//  Copyright © 2018 Vo Duy Khiem. All rights reserved.
//

import Foundation

extension Date {
    
    var tomorrow: Date? {
        return Calendar.current.date(byAdding: .day,
                                     value: 1,
                                     to: self)
    }
    
    func daysCount(until date: Date) -> (weekendDays: Int, workingDays: Int) {
        var weekendDays = 0
        var workingDays = 0
        var startDate = self
        repeat {
            if Calendar.current.isDateInWeekend(startDate) {
                weekendDays +=  1
            } else {
                workingDays += 1
            }
            if let tomorrow = startDate.tomorrow {
                startDate = tomorrow
            } else {
                break
            }
        } while startDate < date
        return (weekendDays, workingDays)
    }
    
    func daysPerYear() -> Int {
        let date = Date()
        let calendar = Calendar.current
        let year = calendar.component(.year, from: date)
        return (year % 4 == 0) ?  366 :  365
    }
    
    func lastDayOfYear() -> Date {
        // Get the current year
        let year = Calendar.current.component(.year, from: Date())
        // Get the first day of next year
        if let firstOfNextYear = Calendar.current.date(from: DateComponents(year: year + 1, month: 1, day: 1)) {
            // Get the last day of the current year
            let lastOfYear = Calendar.current.date(byAdding: .day, value: -1, to: firstOfNextYear)
            return lastOfYear!
        }
        
        return Date()
    }
}

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
    
    func daysCount() -> (weekendDays: Int, workingDays: Int) {
        return daysCount(start: firstDayOfYear, until: lastDayOfYear)
    }
    
    func daysCount(start beginDate: Date?, until endDate: Date) -> (weekendDays: Int, workingDays: Int) {
        var weekendDays = 0
        var workingDays = 0
        var startDate = (beginDate == nil) ? self : beginDate!
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
        } while startDate < endDate
        return (weekendDays, workingDays)
    }
    
    func daysPerYear() -> Int {
        let date = Date()
        let calendar = Calendar.current
        let year = calendar.component(.year, from: date)
        return (year % 4 == 0) ?  366 :  365
    }
    
    var lastDayOfYear: Date {
        get {
            // Get the current year
            let currentYear = Calendar.current.component(.year, from: Date())
            // Get the first day of next year
            if let lastOfYear = Calendar.current.date(from: DateComponents(year: currentYear + 1, month: 1, day: 1)) {
                // Get the last day of the current year
                //let lastOfYear = Calendar.current.date(byAdding: .day, value: -1, to: firstOfNextYear)
                //return lastOfYear!
                return lastOfYear
            }
            
            return Date()
        }
    }
    
    var firstDayOfYear: Date {
        get {
            // Get the current year
            let currentYear = Calendar.current.component(.year, from: Date())
            // Get the first day of next year
            if let lastDayOfYear = Calendar.current.date(from: DateComponents(year: currentYear, month: 1, day: 1)) {
                // Get the first day of the current year
                let firstOfYear = Calendar.current.date(byAdding: .day, value: 1, to: lastDayOfYear)
                return firstOfYear!
            }
    
            return Date()
        }
    }
}

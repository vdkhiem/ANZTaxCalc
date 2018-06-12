//
//  Income.swift
//  ANZTaxCalc
//
//  Created by Vo Duy Khiem on 9/06/18.
//  Copyright © 2018 Vo Duy Khiem. All rights reserved.
//

import Foundation

class Income {
    var salary: Double
    let inputPayFrequency: PayFrequency
    let outputPayFrequency: PayFrequency
    var workHourPerWeek: Int = 40
    let hoursPerDay: Int = 8

    var taxBucket: TaxBucketBase
    var takeHomeCash: Double = 0.0
    
    let date = Date()
    
    // E.g. Input Annual: 92000
    // E.g. Output Annual: 92000, Month: 92000/12=7666.67, Weekly: 92000/365/7)=1764.38, Daily: 92000/250=352.88  Hour: 92000/52*40 = 44.23

    var inputAnnualSalary: Double {
        get {
            switch inputPayFrequency {
            case .Annually:
                return self.salary
            case .Monthly:
                return self.salary * 12
            case .Weekly:
                return self.salary * Double(date.daysPerYear()) / 7
            case .Daily:
                return self.salary * Double(date.daysCount(until: date.lastDayOfYear()).workingDays)
            case .Hourly:
                return self.salary * Double(date.daysPerYear()) / 7 * Double(hoursPerDay)
            }
            
        }
        set {
            self.inputAnnualSalary = newValue
        }
    }
    
    var outputAnnualSalary: Double {
        get {
            switch outputPayFrequency {
            case .Annually:
                return self.inputAnnualSalary
            case .Monthly:
                return self.inputAnnualSalary / 12
            case .Weekly:
                return self.inputAnnualSalary / (Double(date.daysPerYear()) / 7)
            case .Daily:
                return self.inputAnnualSalary / Double(date.daysCount(until: date.lastDayOfYear()).workingDays)
            case .Hourly:
                return self.inputAnnualSalary / Double(date.daysPerYear()) * 7 / Double(hoursPerDay)
            }
        }
        set {
            self.outputAnnualSalary = newValue
        }
    }
    
    var incomeTax: Double {
        return taxBucket.TaxRate(bySalary: salary)
    }
    
    init (taxBucket: TaxBucketBase, salary: Double, inputPayFrequency: PayFrequency, outputPayFrequency: PayFrequency ) {
        self.salary = salary
        self.inputPayFrequency = inputPayFrequency
        self.outputPayFrequency = outputPayFrequency
        self.taxBucket = taxBucket
    }
}

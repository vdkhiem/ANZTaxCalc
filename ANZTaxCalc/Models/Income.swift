//
//  Income.swift
//  ANZTaxCalc
//
//  Created by Vo Duy Khiem on 9/06/18.
//  Copyright © 2018 Vo Duy Khiem. All rights reserved.
//

import Foundation

class Income {
    let salary: Double
    let inputPayFrequency: PayFrequency
    let outputPayFrequency: PayFrequency
    var workHourPerWeek: Int = 40
    let hoursPerDay: Int = 8
    

    var taxBucket: TaxBucketBase
    var takeHomeCash: Double = 0.0
    
    let date = Date()
    
    // E.g. Input Annual: 92000
    // E.g. Output Annual: 92000, Month: 92000/12=7666.67, Fornight: 92000/26=, Week: 92000/52=  Hour: 92000/52*40 = 44.23
    var inputAnnualSalary: Double {
        get {
            switch inputPayFrequency {
            case .Annual:
                return self.salary
            case .Month:
                return self.salary * 12
            case .Fornight:
                return self.salary * 26
            case .Week:
                return self.salary * 52
            case .Hour:
                return self.salary * 52 * Double(workHourPerWeek)
            }
        }
        set {
            self.inputAnnualSalary = newValue
        }
    }
    
    var outputSalary: Double {
        get {
            switch outputPayFrequency {
            case .Annual:
                return self.inputAnnualSalary
            case .Month:
                return self.inputAnnualSalary / 12
            case .Fornight:
                return self.inputAnnualSalary / 26
            case .Week:
                return self.inputAnnualSalary / 52
            case .Hour:
                return self.inputAnnualSalary / 52 / Double(workHourPerWeek)
            }
        }
        set {
            self.outputSalary = newValue
        }
    }
    
    var incomeTax: Double {
        let taxReturn = taxBucket.TaxRate(bySalary: inputAnnualSalary)
        var taxResult: Double
        switch outputPayFrequency {
        case .Annual:
            taxResult = taxReturn
        case .Month:
            taxResult = taxReturn / 12
        case .Fornight:
            taxResult = taxReturn / 26
        case .Week:
            taxResult = taxReturn / 52
        case .Hour:
            taxResult = taxReturn / 52 / Double(workHourPerWeek)
        }
        return Double(taxResult).roundedToDecimalPlace()
    }
    
    init (taxBucket: TaxBucketBase, salary: Double, inputPayFrequency: PayFrequency, outputPayFrequency: PayFrequency ) {
        self.salary = salary
        self.inputPayFrequency = inputPayFrequency
        self.outputPayFrequency = outputPayFrequency
        self.taxBucket = taxBucket
    }

}

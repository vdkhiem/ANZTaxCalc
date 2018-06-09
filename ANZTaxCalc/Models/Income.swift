//
//  Income.swift
//  ANZTaxCalc
//
//  Created by Vo Duy Khiem on 9/06/18.
//  Copyright © 2018 Vo Duy Khiem. All rights reserved.
//

import Foundation

class Income {
    var salary: Double {
        get {
            switch payFrequency {
            case .Annually:
                return self.salary
            case .Monthly:
                return self.salary/12
            case .Weekly:
                return self.salary/52
            case .Daily:
                let date = Date()
                let calendar = Calendar.current
                let year = calendar.component(.year, from: date)
                return (year % 4 == 0) ? self.salary/366 : self.salary/365
            }
        }
        set {
            self.salary = newValue
        }
    }
    var payFrequency: PayFrequency
    var incomeTax: Double {
        return taxBucket.TaxRate(bySalary: salary)
    }
    var taxBucket: TaxBucketBase
    var takeHomeCash: Double = 0.0
    
    init (taxBucket: TaxBucketBase, payFrequency: PayFrequency ) {
        self.payFrequency = payFrequency
        self.taxBucket = taxBucket
    }
}

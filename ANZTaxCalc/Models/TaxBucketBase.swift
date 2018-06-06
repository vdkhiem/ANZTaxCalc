//
//  TaxBucketBase.swift
//  ANZTaxCalc
//
//  Created by Vo Duy Khiem on 6/06/18.
//  Copyright © 2018 Vo Duy Khiem. All rights reserved.
//

import Foundation

class TaxBucketBase {
    var TaxBucket: [Tax] = []
    
    func TaxRate(bySalary: Double) -> Double {
        var incomeTax: Double = 0.0
        var maxLimit: Double = 0.0
        var exit = false
        for i in 0..<TaxBucket.count {
            if bySalary < Double(TaxBucket[i].MaxLimit) {
                maxLimit = bySalary
                exit = true
            } else {
                maxLimit = Double(TaxBucket[i].MaxLimit)
            }
            incomeTax += TaxBucket[i].Rate * (maxLimit - Double(TaxBucket[i].MinLimit))
            if exit {
                return incomeTax
            }
        }
        
        return incomeTax
    }
}

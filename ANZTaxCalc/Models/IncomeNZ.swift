//
//  IncomeNZ.swift
//  ANZTaxCalc
//
//  Created by Vo Duy Khiem on 9/06/18.
//  Copyright © 2018 Vo Duy Khiem. All rights reserved.
//

import Foundation

class IncomeNZ : Income {
    let inputKiwiSaver: Double
    var enableKiwiSaver: Bool = true
    
    var inputAcc: Double = 0.0139
    var enableAcc: Bool = true
    
    init (taxBucket: TaxBucketBase, salary: Double, inputPayFrequency: PayFrequency, outputPayFrequency: PayFrequency, inputKiwiSaver: Double ) {
        self.inputKiwiSaver = inputKiwiSaver
        super.init(taxBucket: taxBucket, salary: salary, inputPayFrequency: inputPayFrequency, outputPayFrequency: outputPayFrequency)
    }
    
    var outputKiwiSaver: Double {
        get {
            return enableKiwiSaver ? Double((outputSalary * inputKiwiSaver / 100)).rounded2Places() : 0
        }
    }
    
    var outputAcc: Double {
        get {
            return enableAcc ? Double((outputSalary * inputAcc)).rounded2Places() : 0
        }
    }
    
    override var takeHomeCash: Double {
        get {
            let contribution = outputKiwiSaver + outputAcc
            return Double(outputSalary - incomeTax - contribution).rounded2Places()
        }
        set {
            self.takeHomeCash = newValue
        }
    }
}

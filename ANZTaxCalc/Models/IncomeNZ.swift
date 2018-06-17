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
    var inputAcc: Double = 0.0139
    
    init (taxBucket: TaxBucketBase, salary: Double, inputPayFrequency: PayFrequency, outputPayFrequency: PayFrequency, inputKiwiSaver: Double ) {
        self.inputKiwiSaver = inputKiwiSaver
        super.init(taxBucket: taxBucket, salary: salary, inputPayFrequency: inputPayFrequency, outputPayFrequency: outputPayFrequency)
    }
    
    var outputKiwiSaver: Double {
        get {
            return Double((outputSalary * inputKiwiSaver / 100)).rounded2Places()
        }
    }
    
    var outputAcc: Double {
        get {
            return Double((outputSalary * inputAcc)).rounded2Places()
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

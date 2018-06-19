//
//  IncomeAU.swift
//  ANZTaxCalc
//
//  Created by Vo Duy Khiem on 9/06/18.
//  Copyright © 2018 Vo Duy Khiem. All rights reserved.
//

import Foundation

class IncomeAU : Income {
    var inputSuperAnnuation: Double
    var inputMediCare = 0.02
    
    init (taxBucket: TaxBucketBase, salary: Double, inputPayFrequency: PayFrequency, outputPayFrequency: PayFrequency, inputSuperAnnuation: Double ) {
        self.inputSuperAnnuation = inputSuperAnnuation
        super.init(taxBucket: taxBucket, salary: salary, inputPayFrequency: inputPayFrequency, outputPayFrequency: outputPayFrequency)
    }

    var outputSuperAnnuation: Double {
        get {
            return Double((outputSalary * inputSuperAnnuation / 100)).rounded2Places()
        }
    }
    
    var outputMediCare: Double {
        get {
            return Double((outputSalary * inputMediCare)).rounded2Places()
        }
    }
    
    override var takeHomeCash: Double {
        get {
            let contribution = outputSuperAnnuation + outputMediCare
            return Double(outputSalary - incomeTax - contribution).rounded2Places()
        }
        set {
            super.takeHomeCash = newValue
        }
    }
}

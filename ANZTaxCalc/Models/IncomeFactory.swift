//
//  IncomeFactory.swift
//  ANZTaxCalc
//
//  Created by Vo Duy Khiem on 19/06/18.
//  Copyright © 2018 Vo Duy Khiem. All rights reserved.
//

import Foundation

class IncomeFactory {
    var salary: Double
    var retirementSaving: Double
    var inputPayFrequency: PayFrequency
    var outputPayFrequency : PayFrequency
    
    init (salary: Double, retirementSaving: Double, inputPayFrequency: PayFrequency,
          outputPayFrequency : PayFrequency) {
        self.salary = salary
        self.retirementSaving = retirementSaving
        self.inputPayFrequency = inputPayFrequency
        self.outputPayFrequency = outputPayFrequency
    }

    func produceIncome(byJurisdiction: Jurisdiction) -> Income {
        switch byJurisdiction{
        case .AU:
            return IncomeAU(taxBucket: TaxBucketAU(), salary: salary, inputPayFrequency: inputPayFrequency, outputPayFrequency: outputPayFrequency, inputSuperAnnuation: retirementSaving)
        case .NZ:
            return IncomeNZ(taxBucket: TaxBucketNZ(), salary: salary, inputPayFrequency: inputPayFrequency, outputPayFrequency: outputPayFrequency, inputKiwiSaver: retirementSaving)
        }
    }
}

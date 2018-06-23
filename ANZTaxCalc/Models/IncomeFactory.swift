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
    let uiUtilities = UIUtilities()
    
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
            let incomeAU = IncomeAU(taxBucket: TaxBucketAU(), salary: salary, inputPayFrequency: inputPayFrequency, outputPayFrequency: outputPayFrequency, inputSuperAnnuation: retirementSaving)
            incomeAU.enableSuperAnnuation = uiUtilities.getSetting(forKey: GlobalConstants.superAnnuation)
            incomeAU.enableMediCare = uiUtilities.getSetting(forKey: GlobalConstants.medicare)
            return incomeAU
        case .NZ:
            let incomeNZ =  IncomeNZ(taxBucket: TaxBucketNZ(), salary: salary, inputPayFrequency: inputPayFrequency, outputPayFrequency: outputPayFrequency, inputKiwiSaver: retirementSaving)
            incomeNZ.enableKiwiSaver = uiUtilities.getSetting(forKey: GlobalConstants.kiwiSaver)
            incomeNZ.enableAcc = uiUtilities.getSetting(forKey: GlobalConstants.acc)
            return incomeNZ
        }
    }
}

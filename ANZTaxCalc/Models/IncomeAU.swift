//
//  IncomeAU.swift
//  ANZTaxCalc
//
//  Created by Vo Duy Khiem on 9/06/18.
//  Copyright © 2018 Vo Duy Khiem. All rights reserved.
//

import Foundation

class IncomeAU : Income {
    var superAnnuation: Double?
    var mediCare: Double?

    override var takeHomeCash: Double {
        get {
            let contribution = super.salary * (superAnnuation!/100) - super.salary * (mediCare!/100)
            return super.salary - super.incomeTax - contribution
        }
        set {
            super.takeHomeCash = newValue
        }
    }
}

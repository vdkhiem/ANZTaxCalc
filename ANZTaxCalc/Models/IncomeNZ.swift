//
//  IncomeNZ.swift
//  ANZTaxCalc
//
//  Created by Vo Duy Khiem on 9/06/18.
//  Copyright © 2018 Vo Duy Khiem. All rights reserved.
//

import Foundation

class IncomeNZ : Income {
    var kiwiSaver: Double?
    var acc: Double?
    
    override var takeHomeCash: Double {
        get {
            let contribution = super.salary * (kiwiSaver!/100) - super.salary * (acc!/100)
            return super.salary - super.incomeTax - contribution
        }
        set {
            self.takeHomeCash = newValue
        }
    }
}

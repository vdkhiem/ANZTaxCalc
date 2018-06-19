//
//  Tax.swift
//  ANZTaxCalc
//
//  Created by Vo Duy Khiem on 6/06/18.
//  Copyright © 2018 Vo Duy Khiem. All rights reserved.
//

import Foundation

class Tax {
    var Jurisdiction: Jurisdiction
    var MinLimit: Int
    var MaxLimit: Int
    var Rate: Double
    
    init(jurisdiction: Jurisdiction, minLimit: Int, maxLimit: Int, rate: Double) {
        self.Jurisdiction = jurisdiction
        self.MinLimit = minLimit
        self.MaxLimit = maxLimit
        self.Rate = rate
    }
}



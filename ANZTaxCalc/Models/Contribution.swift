//
//  Contribution.swift
//  ANZTaxCalc
//
//  Created by Vo Duy Khiem on 6/06/18.
//  Copyright © 2018 Vo Duy Khiem. All rights reserved.
//

import Foundation

class Contribution {
    var Jurisdiction: Jurisdiction
    var Name: String
    var Rate: Double
    init(jurisdiction: Jurisdiction, name: String, rate: Double) {
        self.Jurisdiction = jurisdiction
        self.Name = name
        self.Rate = rate
    }
}

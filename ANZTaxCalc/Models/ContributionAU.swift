//
//  ContributionAU.swift
//  ANZTaxCalc
//
//  Created by Vo Duy Khiem on 7/06/18.
//  Copyright © 2018 Vo Duy Khiem. All rights reserved.
//

import Foundation

class ContributionAU {
    var Contributions: [Contribution] = []
    
    init() {
        self.Contributions.append(Contribution(jurisdiction: .AU, id: "Superannuation", rate: 0.95))
    }
}

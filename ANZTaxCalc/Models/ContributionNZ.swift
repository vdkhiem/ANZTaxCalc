//
//  ContributionNZ.swift
//  ANZTaxCalc
//
//  Created by Vo Duy Khiem on 7/06/18.
//  Copyright © 2018 Vo Duy Khiem. All rights reserved.
//

import Foundation

class ContributionNZ {
    var Contributions: [Contribution] = []
    
    init() {
        self.Contributions.append(Contribution(jurisdiction: .NZ, id: "KiwiSaver", rate: 0.3))
    }
}

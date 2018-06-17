//
//  DoubleExtension.swift
//  ANZTaxCalc
//
//  Created by Vo Duy Khiem on 17/06/18.
//  Copyright © 2018 Vo Duy Khiem. All rights reserved.
//

import Foundation

extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
    
    func rounded2Places() -> Double {
        return rounded(toPlaces: 3)
    }
}

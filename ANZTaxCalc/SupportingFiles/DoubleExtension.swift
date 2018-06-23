//
//  DoubleExtension.swift
//  ANZTaxCalc
//
//  Created by Vo Duy Khiem on 17/06/18.
//  Copyright © 2018 Vo Duy Khiem. All rights reserved.
//

import Foundation

extension Double {
    
    func roundedToDecimalPlace() -> Double {
        return Double(String(format: GlobalConstants.decimalPlace, self))!
    }

}

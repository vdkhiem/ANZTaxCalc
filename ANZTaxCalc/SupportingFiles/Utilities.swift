//
//  Utilities.swift
//  ANZTaxCalc
//
//  Created by Vo Duy Khiem on 17/06/18.
//  Copyright © 2018 Vo Duy Khiem. All rights reserved.
//

import Foundation

public class Utilities {
    static func currencyFormat() -> NumberFormatter {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        // localize to your grouping and decimal separator
        currencyFormatter.locale = Locale.current
        
        return currencyFormatter
    }
}



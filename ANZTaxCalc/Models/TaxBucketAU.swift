//
//  TaxBucketAU.swift
//  ANZTaxCalc
//
//  Created by Vo Duy Khiem on 6/06/18.
//  Copyright © 2018 Vo Duy Khiem. All rights reserved.
//

import Foundation

class TaxBucketAU : TaxBucketBase {
    override init() {
        super.init()
        self.TaxBucket.append(Tax(jurisdiction: .AU, minLimit: 0, maxLimit: 18200, rate: 0))
        self.TaxBucket.append(Tax(jurisdiction: .AU, minLimit: 18200, maxLimit: 37000, rate: 0.19))
        self.TaxBucket.append(Tax(jurisdiction: .AU, minLimit: 37000, maxLimit: 87000, rate: 0.325))
        self.TaxBucket.append(Tax(jurisdiction: .AU, minLimit: 87000, maxLimit: 180000, rate: 0.37))
        self.TaxBucket.append(Tax(jurisdiction: .AU, minLimit: 180000, maxLimit: Int.max, rate: 0.45))
    }
}

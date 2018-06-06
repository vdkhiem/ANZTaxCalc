//
//  TaxBucketNZ.swift
//  ANZTaxCalc
//
//  Created by Vo Duy Khiem on 6/06/18.
//  Copyright © 2018 Vo Duy Khiem. All rights reserved.
//

import Foundation

class TaxBucketNZ : TaxBucketBase {
    override init() {
        super.init()
        self.TaxBucket.append(Tax(jurisdiction: .NZ, minLimit: 0, maxLimit: 14000, rate: 0.105))
        self.TaxBucket.append(Tax(jurisdiction: .NZ, minLimit: 14000, maxLimit: 48000, rate: 0.175))
        self.TaxBucket.append(Tax(jurisdiction: .NZ, minLimit: 48000, maxLimit: 70000, rate: 0.3))
        self.TaxBucket.append(Tax(jurisdiction: .NZ, minLimit: 70000, maxLimit: 180000, rate: 0.33))
    }
}

//
//  FirstViewController.swift
//  ANZTaxCalc
//
//  Created by Vo Duy Khiem on 6/06/18.
//  Copyright © 2018 Vo Duy Khiem. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let taxBucketAU = TaxBucketAU()
        print("AU: \(taxBucketAU.TaxRate(bySalary: 190000))")
        
        let taxBucketNZ = TaxBucketNZ()
        print("NZ: \(taxBucketNZ.TaxRate(bySalary: 190000))")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


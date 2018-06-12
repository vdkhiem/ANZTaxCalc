//
//  FirstViewController.swift
//  ANZTaxCalc
//
//  Created by Vo Duy Khiem on 6/06/18.
//  Copyright © 2018 Vo Duy Khiem. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    // MARK: Inputs
    @IBOutlet weak var taxJurisdictionSegment: UISegmentedControl!
    @IBOutlet weak var frequencyInput: UISegmentedControl!
    @IBOutlet weak var salaryInputText: UITextField!
    @IBOutlet weak var kiwiSaverInputText: UITextField!
    
    // MARK: Output
    @IBOutlet weak var frequencyOutput: UISegmentedControl!
    @IBOutlet weak var salaryOutputText: UITextField!
    @IBOutlet weak var taxOutputText: UITextField!
    @IBOutlet weak var kiwiSaverOutputText: UITextField!
    @IBOutlet weak var accOutputText: UITextField!
    @IBOutlet weak var netOutputText: UITextField!
    
    // Member variables
    var frequencyList = [Int: PayFrequency]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initiateFrequencyList()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func calculateTouchUp(_ sender: Any) {
        let salary: Double = Double(salaryInputText.text!)!
        //let kiwiSaver: Double = Double(kiwiSaverInputText.text!)!
        
        /*
        let taxBucketNZ = TaxBucketNZ()
        let tax: Double = taxBucketNZ.TaxRate(bySalary: salary)
        
        salaryOutputText.text = salaryInputText.text
        taxOutputText.text = "\(tax)"
        kiwiSaverOutputText.text = "\(salary * kiwiSaver/100)"
        netOutputText.text = "\(salary - tax - kiwiSaver/100)"

        
        let taxBucketAU = TaxBucketAU()
        print("AU: \(taxBucketAU.TaxRate(bySalary: 190000))")
        */
        
        let incomeNZ = IncomeNZ(taxBucket: TaxBucketNZ(), salary: Double(salary), inputPayFrequency: frequencyList[frequencyInput.selectedSegmentIndex]!, outputPayFrequency: frequencyList[frequencyOutput.selectedSegmentIndex]!)

        salaryOutputText.text = String(incomeNZ.outputAnnualSalary)
        
    }
    
    // Mark: helper methods
    func initiateFrequencyList() {
        frequencyList[0] = PayFrequency.Annually
        frequencyList[1] = PayFrequency.Monthly
        frequencyList[2] = PayFrequency.Weekly
        frequencyList[3] = PayFrequency.Daily
        frequencyList[4] = PayFrequency.Hourly
    }
}


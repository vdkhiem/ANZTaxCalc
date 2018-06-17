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
        let kiwiSaver: Double = Double(kiwiSaverInputText.text!)!
        
        let incomeNZ = IncomeNZ(taxBucket: TaxBucketNZ(), salary: Double(salary), inputPayFrequency: frequencyList[frequencyInput.selectedSegmentIndex]!, outputPayFrequency: frequencyList[frequencyOutput.selectedSegmentIndex]!, inputKiwiSaver: kiwiSaver)

        salaryOutputText.text = String(incomeNZ.outputSalary)
        taxOutputText.text = String(incomeNZ.incomeTax)
        kiwiSaverOutputText.text = String(incomeNZ.outputKiwiSaver)
        accOutputText.text = String(incomeNZ.outputAcc)
        netOutputText.text = String(incomeNZ.takeHomeCash)
    }
    
    // Mark: helper methods
    func initiateFrequencyList() {
        frequencyList[0] = PayFrequency.Annual
        frequencyList[1] = PayFrequency.Month
        frequencyList[2] = PayFrequency.Fornight
        frequencyList[3] = PayFrequency.Week
        frequencyList[4] = PayFrequency.Hour
    }
}


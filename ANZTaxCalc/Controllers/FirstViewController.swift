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
    let ato = "ATO"
    let ird = "IRD"
    var frequencyList = [Int: PayFrequency]()
    var jurisdictionList = [String: Jurisdiction]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initiateFrequencyList()
        initJurisdictionList()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func calculateTouchUp(_ sender: Any) {
        calculateIncomeTax()
    }
    
    // Mark: helper methods
    func initiateFrequencyList() {
        frequencyList[0] = PayFrequency.Annual
        frequencyList[1] = PayFrequency.Month
        frequencyList[2] = PayFrequency.Fornight
        frequencyList[3] = PayFrequency.Week
        frequencyList[4] = PayFrequency.Hour
    }
    
    func initJurisdictionList() {
        jurisdictionList[ato] = Jurisdiction.AU
        jurisdictionList[ird] = Jurisdiction.NZ
    }
    
    func calculateIncomeTax() {
        let salary: Double = Double(salaryInputText.text!)!
        let kiwiSaver: Double = Double(kiwiSaverInputText.text!)!
        
        let factory = IncomeFactory(salary: Double(salary), retirementSaving: kiwiSaver, inputPayFrequency: frequencyList[frequencyInput.selectedSegmentIndex]!, outputPayFrequency: frequencyList[frequencyOutput.selectedSegmentIndex]!)
        
        let income = factory.produceIncome(byJurisdiction: jurisdictionList[taxJurisdictionSegment.titleForSegment(at: taxJurisdictionSegment.selectedSegmentIndex)!]!)
        
        salaryOutputText.text = String(income.outputSalary)
        taxOutputText.text = String(income.incomeTax)
        
        if taxJurisdictionSegment.titleForSegment(at: taxJurisdictionSegment.selectedSegmentIndex) == ato {
            kiwiSaverOutputText.text = String((income as! IncomeAU).outputSuperAnnuation)
            accOutputText.text = String((income as! IncomeAU).outputMediCare)
            netOutputText.text = String((income as! IncomeAU).takeHomeCash)
        } else {
            kiwiSaverOutputText.text = String((income as! IncomeNZ).outputKiwiSaver)
            accOutputText.text = String((income as! IncomeNZ).outputAcc)
            netOutputText.text = String((income as! IncomeNZ).takeHomeCash)
        }
    }
}


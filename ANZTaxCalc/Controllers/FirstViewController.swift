//
//  FirstViewController.swift
//  ANZTaxCalc
//
//  Created by Vo Duy Khiem on 6/06/18.
//  Copyright © 2018 Vo Duy Khiem. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITabBarControllerDelegate {

    // MARK: Inputs
    @IBOutlet weak var taxJurisdictionSegment: UISegmentedControl!
    @IBOutlet weak var frequencyInput: UISegmentedControl!
    @IBOutlet weak var salaryInputText: UITextField!
    @IBOutlet weak var retirementSavingInputText: UITextField!
    
    // MARK: Output
    @IBOutlet weak var frequencyOutput: UISegmentedControl!
    @IBOutlet weak var salaryOutputText: UITextField!
    @IBOutlet weak var taxOutputText: UITextField!
    @IBOutlet weak var retirementSavingOutputText: UITextField!
    @IBOutlet weak var medicalInsuranceOutputText: UITextField!
    @IBOutlet weak var netOutputText: UITextField!
    @IBOutlet weak var retirementLabel: UILabel!
    @IBOutlet weak var medicalInsuranceLabel: UILabel!
    
    // Member variables
    var frequencyList = [Int: PayFrequency]()
    var jurisdictionList = [String: Jurisdiction]()
    let uiUtilities = UIUtilities()
    
    // Mark: Events
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.delegate = self
        loadAppearance()
        initiateFrequencyList()
        initJurisdictionList()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // Allow to refresh UI and Data when switch back to Tax tab
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let tabBarIndex = tabBarController.selectedIndex
        if tabBarIndex == 0 {
            refreshApperanceAndTaxCalculation()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func calculateTouchUp(_ sender: Any) {
        refreshApperanceAndTaxCalculation()
    }
    
    @IBAction func taxJurisdictionSegmentValueChanged(_ sender: UISegmentedControl) {
        refreshApperanceAndTaxCalculation()
    }
    
    @IBAction func inputFrequencyValueChanged(_ sender: UISegmentedControl) {
        refreshApperanceAndTaxCalculation()
    }
    
    @IBAction func outputFrequencyValueChanged(_ sender: UISegmentedControl) {
        refreshApperanceAndTaxCalculation()
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
        jurisdictionList[GlobalConstants.ato] = Jurisdiction.AU
        jurisdictionList[GlobalConstants.ird] = Jurisdiction.NZ
    }
    
    func refreshApperanceAndTaxCalculation() {
        loadAppearance()
        calculateIncomeTax()
    }
    
    func calculateIncomeTax() {
        if (salaryInputText.text == nil || salaryInputText.text!.isEmpty) {
            return;
        }
        let salary: Double = Double(salaryInputText.text!)!
        
        let retirementSaving: Double = Double(retirementSavingInputText.text!)!
        
        let factory = IncomeFactory(salary: Double(salary), retirementSaving: retirementSaving, inputPayFrequency: frequencyList[frequencyInput.selectedSegmentIndex]!, outputPayFrequency: frequencyList[frequencyOutput.selectedSegmentIndex]!)
        
        let income = factory.produceIncome(byJurisdiction: jurisdictionList[taxJurisdictionSegment.titleForSegment(at: taxJurisdictionSegment.selectedSegmentIndex)!]!)
        
        salaryOutputText.text = String(income.outputSalary)
        taxOutputText.text = String(income.incomeTax)
        
        if taxJurisdictionSegment.titleForSegment(at: taxJurisdictionSegment.selectedSegmentIndex) == GlobalConstants.ato {
            retirementSavingOutputText.text = String((income as! IncomeAU).outputSuperAnnuation)
            medicalInsuranceOutputText.text = String((income as! IncomeAU).outputMediCare)
            netOutputText.text = String((income as! IncomeAU).takeHomeCash)
        } else {
            retirementSavingOutputText.text = String((income as! IncomeNZ).outputKiwiSaver)
            medicalInsuranceOutputText.text = String((income as! IncomeNZ).outputAcc)
            netOutputText.text = String((income as! IncomeNZ).takeHomeCash)
        }
    }
    
    func loadAppearance() {
        if taxJurisdictionSegment.titleForSegment(at: taxJurisdictionSegment.selectedSegmentIndex) == GlobalConstants.ato {
            retirementSavingOutputText.isUserInteractionEnabled = uiUtilities.getSetting(forKey: GlobalConstants.superAnnuation)
            medicalInsuranceOutputText.isUserInteractionEnabled = uiUtilities.getSetting(forKey: GlobalConstants.medicare)
            retirementSavingInputText.placeholder = "Super Annuation (%)"
            retirementLabel.text = "Super Annuation"
            medicalInsuranceLabel.text = "Medicare"
        } else {
            retirementSavingOutputText.isUserInteractionEnabled = uiUtilities.getSetting(forKey: GlobalConstants.kiwiSaver)
            medicalInsuranceOutputText.isUserInteractionEnabled = uiUtilities.getSetting(forKey: GlobalConstants.acc)
            retirementSavingInputText.placeholder = "Kiwi Saver (%)"
            retirementLabel.text = "KiwiSaver"
            medicalInsuranceLabel.text = "Acc"
        }
    }
}


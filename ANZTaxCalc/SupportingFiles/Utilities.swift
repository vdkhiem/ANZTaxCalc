//
//  Utilities.swift
//  ANZTaxCalc
//
//  Created by Vo Duy Khiem on 17/06/18.
//  Copyright © 2018 Vo Duy Khiem. All rights reserved.
//

import Foundation
import CoreData
import UIKit

public class Utilities {
    
    
    static func formatNumber(value: Double) -> String {
        return String(format: GlobalConstants.decimalPlace, value)
    }
    
    static func currencyFormat() -> NumberFormatter {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        // localize to your grouping and decimal separator
        currencyFormatter.locale = Locale.current
        
        return currencyFormatter
    }
    
    /*
     // MARK: - Core Data Management
     */
    var settingDataCoreManager = CoreDataManager(appDelegate: UIApplication.shared.delegate as! AppDelegate, entityName: "Setting")
    
    func loadSetting(uiSwitch: UISwitch, forKey: String) {
        if let cardTypeSetting = getSetting() {
            uiSwitch.isOn = cardTypeSetting.value(forKey: forKey) as! Bool
        }
    }
    
    func getSetting() -> NSManagedObject? {
        let settingList = settingDataCoreManager.fetchRows()
        if (settingList.count > 0 ) {
            return settingList.first
        }
        return nil
    }
    
    func saveSetting(uiSwitch: UISwitch, forKey: String) {
        if let setting = getSetting() {
            setting.setValue(uiSwitch.isOn, forKey: forKey)
        } else {
            let rowEntity = settingDataCoreManager.newRowToEntity()
            rowEntity.setValue(uiSwitch.isOn, forKey: forKey)
            
        }
    }
}



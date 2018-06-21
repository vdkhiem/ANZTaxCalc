//
//  UIUtilities.swift
//  ANZTaxCalc
//
//  Created by Vo Duy Khiem on 21/06/18.
//  Copyright © 2018 Vo Duy Khiem. All rights reserved.
//

import Foundation
import CoreData
import UIKit

public class UIUtilities {
    var settingDataCoreManager = CoreDataManager(appDelegate: UIApplication.shared.delegate as! AppDelegate, entityName: "Setting")
    
    /*
     // MARK: - Core Data Management
     */
    func getSetting(forKey: String) -> Bool {
        if let cardTypeSetting = getSetting() {
            return cardTypeSetting.value(forKey: forKey) as! Bool
        }
        return true
    }
    
    func loadSetting(uiSwitch: UISwitch, forKey: String) {
        if let setting = getSetting() {
            if let settingValue = setting.value(forKey: forKey) {
                uiSwitch.isOn = settingValue as! Bool
            } else {
                saveSetting(uiSwitch: uiSwitch, forKey: forKey)
            }
        } else {
            saveSetting(uiSwitch: uiSwitch, forKey: forKey)
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

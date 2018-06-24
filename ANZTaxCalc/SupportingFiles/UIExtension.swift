//
//  UIExtension.swift
//  ANZTaxCalc
//
//  Created by Vo Duy Khiem on 24/06/18.
//  Copyright © 2018 Vo Duy Khiem. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    // This function allows to hide keypad to tap anywhere on screen
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

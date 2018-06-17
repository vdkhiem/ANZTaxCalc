//
//  ANZTaxCalcTests.swift
//  ANZTaxCalcTests
//
//  Created by Vo Duy Khiem on 6/06/18.
//  Copyright © 2018 Vo Duy Khiem. All rights reserved.
//

import XCTest
@testable import ANZTaxCalc

class ANZTaxCalcTests: XCTestCase {
    var frequencyList = [Int: PayFrequency]()
    let salary = 92000.00
    let taxBucketNZ = TaxBucketNZ()
    let date = Date()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testInputAnnualSalaryNZ() {
        var incomeNZ = IncomeNZ(taxBucket: taxBucketNZ, salary: Double(salary), inputPayFrequency: .Annual, outputPayFrequency: .Annual)
        
        XCTAssertEqual(salary, incomeNZ.inputAnnualSalary)
        
        incomeNZ = IncomeNZ(taxBucket: taxBucketNZ, salary: Double(salary/12), inputPayFrequency: .Month, outputPayFrequency: .Annual)
        
        XCTAssertEqual(salary, incomeNZ.inputAnnualSalary)
        
        incomeNZ = IncomeNZ(taxBucket: taxBucketNZ, salary: salary/26, inputPayFrequency: .Fornight, outputPayFrequency: .Fornight)
        
        XCTAssertEqual(salary, incomeNZ.inputAnnualSalary)
        
        incomeNZ = IncomeNZ(taxBucket: taxBucketNZ, salary: Double(salary/52), inputPayFrequency: .Week, outputPayFrequency: .Week)
        
        XCTAssertEqual(salary, incomeNZ.inputAnnualSalary)
        
        incomeNZ = IncomeNZ(taxBucket: taxBucketNZ, salary: Double(salary/52/40), inputPayFrequency: .Hour, outputPayFrequency: .Hour)
        
        XCTAssertEqual(salary, incomeNZ.inputAnnualSalary)
    }
    
}

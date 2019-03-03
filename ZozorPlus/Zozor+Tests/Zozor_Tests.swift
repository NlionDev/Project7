//
//  Zozor_Tests.swift
//  CountOnMeTests
//
//  Created by Ambroise COLLON on 30/08/2016.
//  Copyright © 2016 Ambroise Collon. All rights reserved.
//

import XCTest
@testable import CountOnMe

class Zozor_Tests: XCTestCase {
    
    var calculator: Calculator!
    
    override func setUp() {
        super.setUp()
        calculator = Calculator()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGivenArraysAreNotClear_WhenClear_ThenArraysHaveDefaultValues() {
        calculator.stringNumbers.append("45")
        calculator.operators.append("-")
        
        calculator.clear()
        
        XCTAssert(calculator.stringNumbers[0] == "")
        XCTAssert(calculator.operators[0] == "+")
        XCTAssertEqual(calculator.stringNumbers.count, 1)
    }
    
    func testGivenHaveNoOperators_WhenAddNumbers_ThenPlusIsAddToOperators() {
        calculator.addNewNumber(5)
        do {
            try calculator.add()
            XCTAssert(calculator.operators[1] == "+")
            XCTAssert(calculator.stringNumbers[1] == "")
        } catch {
            XCTFail()
        }
    }
    
    func testGivenStringNumbersIsEmpty_WhenAddNumbers_ThenErrorAppear() {
        do {
            try calculator.add()
        } catch {
            XCTFail()
        }
    }
    
    func testGivenStringNumbersIsEmpty_WhenSubtractNumbers_ThenErrorAppear() {
        do {
            try calculator.subtract()
        } catch {
            XCTFail()
        }
    }

    
    func testGivenHaveNoOperators_WhenSubtractNumbers_ThenMinusIsAddToOperators() {
       calculator.addNewNumber(5)
        do {
            try calculator.subtract()
            XCTAssert(calculator.operators[1] == "-")
            XCTAssert(calculator.stringNumbers[1] == "")
        } catch {
            XCTFail()
        }
    }
    
    func testGivenStringNumberIsEmpty_WhenAddDecimalsNumbers_ThenStringNumbersShouldBeFloat() {
      calculator.addFloatNumber()
        
        XCTAssert(calculator.stringNumbers.last == "0.")
    }
    
    func testGivenLastStringNumberIsTwo_WhenAddDecimalsNumbers_ThenStringNumbersShouldBeTwoPoint() {
        calculator.stringNumbers[0] = "2"

        calculator.addFloatNumber()

        XCTAssert(calculator.stringNumbers.last == "2.")
    }
    
    func testGivenLastStringNumberIsEmpty_WhenNumberIsAdd_ThenNumberShouldBeReturned() {
        calculator.addNewNumber(5)
        
        let nextString = calculator.getNextString()
        
        XCTAssertEqual(nextString, "5")
    }
    
    func testGivenLastStringNumberIsNumber_WhenOperatorIsAdd_ThenNumberAndOperatorShouldBeReturned() {
        calculator.addNewNumber(5)
        do {
            try calculator.add()
        } catch {
            XCTFail()
        }
        
         let nextString = calculator.getNextString()

        XCTAssertEqual(nextString, "5+")
    }
    
    func testGivenHaveAddition_WhenTotalIsCalculate_ThenGoodResultShouldBeReturned() {
        calculator.addNewNumber(5)
        do {
            try calculator.add()
        } catch {
            XCTFail()
        }
        calculator.addNewNumber(5)
        
        do {
            let total = try calculator.calculateTotal()
            XCTAssertEqual(total, 10.0)
        } catch {
            XCTFail()
        }
    }
    
    func testGivenHaveSubstraction_WhenTotalIsCalculate_ThenGoodResultShouldBeReturned() {
        calculator.addNewNumber(8)
        do {
            try calculator.subtract()
        } catch {
            XCTFail()
        }
        calculator.addNewNumber(5)
        
        do {
            let total = try calculator.calculateTotal()
            XCTAssertEqual(total, 3.0)
        } catch {
            XCTFail()
        }
    }
    
    func testGivenHaveInvalidOperation_WhenTotalIsCalculate_ThenErrorShouldBeAppear() {
        calculator.addNewNumber(5)
        do {
            try calculator.add()
        } catch {
            XCTFail()
        }
        
        do {
            let total = try calculator.calculateTotal()
        } catch {
            XCTFail()
        }
    }
    
    func testGivenStringNumbersIsEmpty_WhenTotalIsCalculate_ThenErrorShouldBeAppear() {
        do {
            let total = try calculator.calculateTotal()
        } catch {
            XCTFail()
        }
    }

}

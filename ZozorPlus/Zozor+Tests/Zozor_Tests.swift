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
    
    func testGivenTheArraysAreNotClear_WhenIClearTheArrays_ThenTheArraysAreClear() {
        calculator.stringNumbers.append("45")
        calculator.operators.append("-")
        
        calculator.clear()
        
        XCTAssert(calculator.stringNumbers[0] == "")
        XCTAssert(calculator.operators[0] == "+")
    }
    
    func testGivenIHaveNoOperators_WhenIWantToAddNumbers_ThenAPlusIsAddToOperators() {
        calculator.add()
        
        XCTAssert(calculator.operators[1] == "+")
        XCTAssert(calculator.stringNumbers[1] == "")
    }
    
    func testGivenIHaveNoOperators_WhenIWantToSubtractNumbers_ThenAMinusIsAddToOperators() {
        calculator.subtract()
        
        XCTAssert(calculator.operators[1] == "-")
        XCTAssert(calculator.stringNumbers[1] == "")
    }
    
    func testGivenStringNumberIsEmpty_WhenIWantToAddDecimalsNumbers_ThenStringNumbersShouldBeFloat() {
      calculator.addFloatNumber()
        
        XCTAssert(calculator.stringNumbers.last == "0.")
    }
    
    func testGivenLastStringNumberIsTwo_WhenIWantToAddDecimalsNumbers_ThenStringNumbersShouldBeTwoPoint() {
        calculator.stringNumbers[0] = "2"

        calculator.addFloatNumber()

        XCTAssert(calculator.stringNumbers.last == "2.")
    }
    
}

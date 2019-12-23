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

    func testGivenHaveValuesInArrays_WhenClear_ThenArraysHaveDefaultValues() {
        calculator.stringNumbers.append("45")
        calculator.operators.append("-")
        
        calculator.clear()
        
        XCTAssertEqual(calculator.stringNumbers[0], "")
        XCTAssertEqual(calculator.operators[0], "+")
        XCTAssertEqual(calculator.stringNumbers.count, 1)
    }
    
    func testGivenHaveFive_WhenTapOnPlusButton_ThenPlusIsAddToOperators() {
        calculator.addNewNumber(5)
        
        XCTAssertNoThrow(try calculator.plus())
        
        XCTAssertEqual(calculator.operators[1], "+")
        XCTAssertEqual(calculator.stringNumbers[1], "")
    }
    
    func testGivenHaveNoNumbers_WhenTapOnPlusButton_ThenEnterNumberErrorAppear() {
        XCTAssertThrowsError(try calculator.plus()) { error in
            XCTAssertNotNil(error as? Calculator.CalculatorError)
            XCTAssertEqual(error as! Calculator.CalculatorError, Calculator.CalculatorError.enterNumber)
        }
    }
    
    func testGivenHaveNoNumbers_WhenTapOnMinusButton_ThenErrorAppear() {
        XCTAssertThrowsError(try calculator.minus()) { error in
            XCTAssertNotNil(error as? Calculator.CalculatorError)
            XCTAssertEqual(error as! Calculator.CalculatorError, Calculator.CalculatorError.enterNumber)
        }
    }

    
    func testGivenHaveFive_WhenTapOnMinusButton_ThenMinusIsAddToOperators() {
        calculator.addNewNumber(5)
        
        XCTAssertNoThrow(try calculator.minus())
        XCTAssertEqual(calculator.operators[1], "-")
        XCTAssertEqual(calculator.stringNumbers[1], "")
    }
    
    func testGivenHaveNoNumbers_WhenTapOnDecimalButton_ThenNumberShouldBeZeroPoint() {
        calculator.addFloatNumber()
        
        XCTAssertEqual(calculator.stringNumbers.last, "0.")
    }
    
    func testGivenHaveTwo_WhenTapOnDecimalButton_ThenStringNumbersShouldBeTwoPoint() {
        calculator.stringNumbers[0] = "2"

        calculator.addFloatNumber()

        XCTAssertEqual(calculator.stringNumbers.last, "2.")
    }
    
    func testGivenHaveNoNumbers_WhenTapOnFiveButton_ThenFiveShouldBeReturned() {
        
        calculator.addNewNumber(5)
        
        let nextString = calculator.getNextString()
        XCTAssertEqual(nextString, "5")
    }
    
    func testGivenHaveFive_WhenTapOnPlusButton_ThenStringToDisplayShouldBeFiveAndPlus() {
        calculator.addNewNumber(5)
        
        XCTAssertNoThrow(try calculator.plus())
        
        let nextString = calculator.getNextString()
        XCTAssertEqual(nextString, "5+")
    }
    
    func testGivenHaveFivePlusFive_WhenTotalIsCalculate_ThenResultShouldBeTen() {
        calculator.addNewNumber(5)
        
        XCTAssertNoThrow(try calculator.plus())
        
        calculator.addNewNumber(5)
        
        let total = try? calculator.calculateTotal()
        XCTAssertEqual(total, 10.0)
    }
    
    func testGivenHaveEightMinusFive_WhenTotalIsCalculate_ThenResultShouldBeThree() {
        calculator.addNewNumber(8)
        
        XCTAssertNoThrow(try calculator.minus())
        
        calculator.addNewNumber(5)
        
        let total = try? calculator.calculateTotal()
        XCTAssertEqual(total, 3.0)
    }
    
    func testGivenHaveFivePlus_WhenTotalIsCalculate_ThenIncorrectExpressionErrorShouldAppear() {
        calculator.addNewNumber(5)
        XCTAssertNoThrow(try calculator.plus())
        
        XCTAssertThrowsError(try calculator.calculateTotal()) { error in
            XCTAssertNotNil(error as? Calculator.CalculatorError)
            XCTAssertEqual(error as! Calculator.CalculatorError, Calculator.CalculatorError.inCorrectExpression)
        }
    }
    
    func testGivenHaveNoNumbers_WhenTotalIsCalculate_ThenStartNewCalculErrorShouldAppear() {
        
        XCTAssertThrowsError(try calculator.calculateTotal()) { error in
            XCTAssertNotNil(error as? Calculator.CalculatorError)
            XCTAssertEqual(error as! Calculator.CalculatorError, Calculator.CalculatorError.startNewCalcul)
        }
    }

}

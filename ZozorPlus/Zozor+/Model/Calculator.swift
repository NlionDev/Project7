//
//  Calculate.swift
//  CountOnMe
//
//  Created by Nicolas Lion on 10/02/2019.
//  Copyright © 2019 Ambroise Collon. All rights reserved.
//

import Foundation
import UIKit

class Calculator {
    
    // MARK: - Properties
    
    var stringNumbers: [String] = [String()]
    var operators: [String] = ["+"]
    
    // MARK: - Enum
    
    enum CalculatorError: Error {
        case inCorrectExpression
        case startNewCalcul
        case enterNumber
    }
    
    // MARK: - Methods

    func clear() {
        stringNumbers = [String()]
        operators = ["+"]
    }
    
    func add() {
        operators.append("+")
        stringNumbers.append("")
    }
    
    func subtract() {
        operators.append("-")
        stringNumbers.append("")
    }
    
    func addFloatNumber() {
        if let stringNumber = stringNumbers.last {
            if stringNumber.isEmpty {
                stringNumbers[stringNumbers.count-1] = "0."
            } else {
                var stringNumberMutable = stringNumber
                stringNumberMutable += "."
                stringNumbers[stringNumbers.count-1] = stringNumberMutable
            }
        }
    }

    func checkExpressionError() throws {
        if let stringNumber = stringNumbers.last {
            if stringNumber.isEmpty {
                if stringNumbers.count == 1 {
                    throw CalculatorError.startNewCalcul
                } else if stringNumbers.count != 1 {
                    throw CalculatorError.inCorrectExpression
                }
            }
        }
    }

    func checkIfCanAddOperator() throws {
        if let stringNumber = stringNumbers.last {
            if stringNumber.isEmpty {
                throw CalculatorError.enterNumber
            }
        }
    }

    func addNewNumber(_ newNumber: Int) {
        if let stringNumber = stringNumbers.last {
            var stringNumberMutable = stringNumber
            stringNumberMutable += "\(newNumber)"
            stringNumbers[stringNumbers.count-1] = stringNumberMutable
        }
    }

    func updateValues() -> String {
        var text = ""
        for (i, stringNumber) in stringNumbers.enumerated() {
            // Add operator
            if i > 0 {
                text += operators[i]
            }
            // Add number
            text += stringNumber
        }
        return text
    }

    func calculateTotal() -> Float {
        var total = Float(0)
        for (i, stringNumber) in stringNumbers.enumerated() {
            if let number = Float(stringNumber) {
                if operators[i] == "+" {
                    total += number
                } else if operators[i] == "-" {
                    total -= number
                }
            }
        }
        return total
    }
}

//
//  Calculate.swift
//  CountOnMe
//
//  Created by Nicolas Lion on 10/02/2019.
//  Copyright © 2019 Ambroise Collon. All rights reserved.
//

import Foundation

class Calculator {
    
    // MARK: - Properties
    
    var stringNumbers: [String] = [String()]
    var operators: [String] = ["+"]
    

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
    
    func calculateTotal() -> Int {
        var total = 0
        for (i, stringNumber) in stringNumbers.enumerated() {
            if let number = Int(stringNumber) {
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

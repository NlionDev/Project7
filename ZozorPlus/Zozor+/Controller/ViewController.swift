//
//  ViewController.swift
//  CountOnMe
//
//  Created by Ambroise COLLON on 30/08/2016.
//  Copyright © 2016 Ambroise Collon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    private let calculator = Calculator()
    
    private var isExpressionCorrect: Bool {
        if let stringNumber = calculator.stringNumbers.last {
            if stringNumber.isEmpty {
                if calculator.stringNumbers.count == 1 {
                    let alertVC = UIAlertController(title: "Zéro!", message: "Démarrez un nouveau calcul !", preferredStyle: .alert)
                    alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                    self.present(alertVC, animated: true, completion: nil)
                } else {
                    let alertVC = UIAlertController(title: "Zéro!", message: "Entrez une expression correcte !", preferredStyle: .alert)
                    alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                    self.present(alertVC, animated: true, completion: nil)
                }
                return false
            }
        }
        return true
    }

    private var canAddOperator: Bool {
        if let stringNumber = calculator.stringNumbers.last {
            if stringNumber.isEmpty {
                let alertVC = UIAlertController(title: "Zéro!", message: "Expression incorrecte !", preferredStyle: .alert)
                alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alertVC, animated: true, completion: nil)
                return false
            }
        }
        return true
    }

    // MARK: - Outlets

    @IBOutlet private weak var textView: TextView!
    @IBOutlet private var numberButtons: [UIButton]!

    // MARK: - Action

    @IBAction private func tappedNumberButton(_ sender: UIButton) {
        for (i, numberButton) in numberButtons.enumerated() {
            if sender == numberButton {
                calculator.addNewNumber(i)
            }
        }
        textView.updateDisplay()
    }

    @IBAction private func plus() {
        if canAddOperator {
            calculator.add()
            textView.updateDisplay()
        }
    }

    @IBAction private func minus() {
        if canAddOperator {
            calculator.subtract()
            textView.updateDisplay()
        }
    }

    @IBAction private func equal() {
        calculateTotal()
    }
    
    private func calculateTotal() {
        if !isExpressionCorrect {
            return
        }
        textView.printTotal()
    }
}


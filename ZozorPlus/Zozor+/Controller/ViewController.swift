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

    // MARK: - Enumeration
    
    private enum errors: Error {
        case inCorrectExpression
        case startNewCalcul
        case enterNumber
    }
    
    // MARK: - Outlets

    @IBOutlet private weak var textView: TextView!
    @IBOutlet private var numberButtons: [UIButton]!
    @IBOutlet weak var floatButton: UIButton!
    @IBOutlet weak var cleanButton: UIButton!

    // MARK: - Action

    @IBAction private func tappedNumberButton(_ sender: UIButton) {
        for (i, numberButton) in numberButtons.enumerated() where sender == numberButton {
                calculator.addNewNumber(i)
                updateDisplay()
        }
    }

    @IBAction private func didTapCleanButton() {
        cleanDisplay()
    }

    @IBAction private func didTapFloatButton() {
        calculator.addFloatNumber()
        updateDisplay()
    }

    @IBAction private func plus() {
        do {
            try calculator.checkIfCanAddOperator(error: errors.enterNumber)
        } catch errors.enterNumber {
            displayError(expressionError: .enterNumber)
            return
        } catch {
            displayError(alertTitle: "Erreur Inconnue.", message: "Une erreur est survenue, essayez à nouveau.", actionTitle: "Ok")
            cleanDisplay()
            return
        }
            calculator.add()
            updateDisplay()
    }

    @IBAction private func minus() {
        do {
            try calculator.checkIfCanAddOperator(error: errors.enterNumber)
        } catch errors.enterNumber {
            displayError(expressionError: .enterNumber)
            return
        } catch {
            displayError(alertTitle: "Erreur Inconnue.", message: "Une erreur est survenue, essayez à nouveau.", actionTitle: "Ok")
            cleanDisplay()
            return
        }
            calculator.subtract()
            updateDisplay()
    }

    @IBAction private func equal() {
        do {
            try calculator.checkExpressionError(firstError: errors.startNewCalcul, secondError: errors.inCorrectExpression)
        } catch errors.inCorrectExpression {
            displayError(expressionError: .inCorrectExpression)
            return
        } catch errors.startNewCalcul {
            displayError(expressionError: .startNewCalcul)
            return
        } catch {
            displayError(alertTitle: "Erreur Inconnue.", message: "Une erreur est survenue, essayez à nouveau.", actionTitle: "Ok")
            cleanDisplay()
        }
        printTotal()
    }

    // MARK: - Methods

    private func displayError(expressionError error: errors) {
        switch error {
        case .inCorrectExpression:
            displayError(alertTitle: "Expression Incorrect.", message: "Entrez une expression correct", actionTitle: "OK")
            cleanDisplay()
        case .startNewCalcul:
            displayError(alertTitle: "Expression Incorrect", message: "Démarrez un nouveau calcul !", actionTitle: "OK")
            cleanDisplay()
        case .enterNumber:
            displayError(alertTitle: "Expression Incorrect", message: "Vous devez d'abord entrer un chiffre.", actionTitle: "OK")
            cleanDisplay()
        }
    }

    private func displayError(alertTitle: String, message: String, actionTitle: String) {
        let alertVC = UIAlertController(title: alertTitle, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: actionTitle, style: .cancel, handler: nil))
        present(alertVC, animated: true, completion: nil)
    }

    private func updateDisplay() {
        let text = calculator.updateValues()
        textView.text = text
    }

    private func printTotal() {
        let total = calculator.calculateTotal()
        textView.text = "\(total)"
        calculator.clear()
    }

    private func cleanDisplay() {
        calculator.clear()
        textView.text = "0"
    }
}

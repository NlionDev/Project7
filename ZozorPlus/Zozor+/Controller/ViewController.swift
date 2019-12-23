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
    
    // MARK: - Outlets

    @IBOutlet weak var calculatorView: CalculatorView!
    @IBOutlet private weak var displayView: DisplayView!
    @IBOutlet private var numberButtons: [UIButton]!
    @IBOutlet private weak var floatButton: UIButton!
    @IBOutlet private weak var cleanButton: UIButton!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatorView.delegate = self
    }
    
    // MARK: - Action

    @IBAction private func tappedNumberButton(_ sender: UIButton) {
        for (i, numberButton) in numberButtons.enumerated() where sender == numberButton {
                calculator.addNewNumber(i)
                updateDisplay()
            calculatorView.setNormalStyleForButtons()
        }
    }

    @IBAction private func didTapCleanButton() {
        cleanDisplay()
        calculatorView.setNormalStyleForButtons()
    }

    @IBAction private func didTapFloatButton() {
        calculator.addFloatNumber()
        updateDisplay()
        calculatorView.setNormalStyleForButtons()
    }

    // MARK: - Methods

    private func displayError(_ error: Calculator.CalculatorError) {
        switch error {
        case .inCorrectExpression:
            displayAlert(alertTitle: "Expression Incorrect.", message: "Entrez une expression correct", actionTitle: "OK")
            cleanDisplay()
        case .startNewCalcul:
            displayAlert(alertTitle: "Expression Incorrect", message: "Démarrez un nouveau calcul !", actionTitle: "OK")
            cleanDisplay()
        case .enterNumber:
            displayAlert(alertTitle: "Expression Incorrect", message: "Vous devez d'abord entrer un chiffre.", actionTitle: "OK")
            cleanDisplay()
        }
    }

    private func displayAlert(alertTitle: String, message: String, actionTitle: String) {
        let alertVC = UIAlertController(title: alertTitle, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: actionTitle, style: .cancel, handler: nil))
        present(alertVC, animated: true, completion: nil)
    }

    private func updateDisplay() {
        let text = calculator.getNextString()
        displayView.text = text
    }

    private func cleanDisplay() {
        calculator.clear()
        displayView.text = "0"
    }
}

// MARK: - Extensions

extension ViewController: CalculatorViewDelegate {
    
    func calculatorView(_ calculatorView: CalculatorView, didSelectOperator op: CalculatorView.Operator) {
        switch op {
            case .plus:
            selectPlusOperator()
            case .minus:
            selectMinusOperator()
            case .equal:
            selectEqualOperator()
        }
    }
    
    private func selectPlusOperator() {
        do {
            try calculator.plus()
            updateDisplay()
        } catch let error as Calculator.CalculatorError {
            displayError(error)
        } catch {
            displayAlert(alertTitle: "Erreur Inconnue.", message: "Une erreur est survenue, essayez à nouveau.", actionTitle: "Ok")
            cleanDisplay()
        }
    }
    
    private func selectMinusOperator() {
        do {
            try calculator.minus()
            updateDisplay()
        } catch let error as Calculator.CalculatorError {
            displayError(error)
        } catch {
            displayAlert(alertTitle: "Erreur Inconnue.", message: "Une erreur est survenue, essayez à nouveau.", actionTitle: "Ok")
            cleanDisplay()
        }
    }
    
    private func selectEqualOperator() {
        do {
            let total = try calculator.calculateTotal()
            displayView.text = "\(total)"
            calculator.clear()
        } catch let error as Calculator.CalculatorError {
            displayError(error)
        } catch {
            displayAlert(alertTitle: "Erreur Inconnue.", message: "Une erreur est survenue, essayez à nouveau.", actionTitle: "Ok")
            cleanDisplay()
        }
    }
}


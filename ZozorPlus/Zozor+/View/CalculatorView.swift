//
//  OperatorsButtons.swift
//  CountOnMe
//
//  Created by Nicolas Lion on 19/02/2019.
//  Copyright © 2019 Ambroise Collon. All rights reserved.
//

import UIKit

protocol CalculatorViewDelegate: class {
    
    func calculatorView(_ calculatorView: CalculatorView, didSelectOperator op: CalculatorView.Operator)
}

class CalculatorView: UIView {
    
    // MARK: Properties
    
    weak var delegate: CalculatorViewDelegate?
    
    // MARK: - Enum
    
    enum Operator {
        case plus
        case minus
        case equal
    }
    
    // MARK: - Outlets
    
    @IBOutlet private weak var plusButton: UIButton! {
        didSet {
            plusButton.layer.cornerRadius = 10
            plusButton.setTitleColor(#colorLiteral(red: 0.4691326092, green: 0.7149516575, blue: 0.6240751724, alpha: 1), for: .selected)
        }
    }
    
    @IBOutlet private weak var minusButton: UIButton! {
        didSet {
            minusButton.layer.cornerRadius = 10
            minusButton.setTitleColor(#colorLiteral(red: 0.8751251101, green: 0.3733541965, blue: 0.3268560469, alpha: 1), for: .selected)
        }
    }
    
    @IBOutlet private weak var equalButton: UIButton! {
        didSet {
            equalButton.layer.cornerRadius = 10
            equalButton.setTitleColor(#colorLiteral(red: 0.9439501166, green: 0.6425412893, blue: 0.1273810863, alpha: 1), for: .selected)
        }
    }
    
    // MARK: - Actions
    
    @IBAction func didTapPlusButton() {
        selectPlusButton()
        delegate?.calculatorView(self, didSelectOperator: .plus)
        
    }
    
    @IBAction func didTapMinusButton() {
        selectMinusButton()
        delegate?.calculatorView(self, didSelectOperator: .minus)
    }
    
    @IBAction func didTapEqualButton() {
        selectEqualButton()
        delegate?.calculatorView(self, didSelectOperator: .equal)
    }
    
    // MARK: - Methods
    
    func setNormalStyleForButtons() {
        if plusButton.isSelected {
            plusButton.backgroundColor = #colorLiteral(red: 0.4691326092, green: 0.7149516575, blue: 0.6240751724, alpha: 1)
            plusButton.isSelected = false
        } else if minusButton.isSelected {
            minusButton.backgroundColor = #colorLiteral(red: 0.8751251101, green: 0.3733541965, blue: 0.3268560469, alpha: 1)
            minusButton.isSelected = false
        } else if equalButton.isSelected {
            equalButton.backgroundColor = #colorLiteral(red: 0.9439501166, green: 0.6425412893, blue: 0.1273810863, alpha: 1)
            equalButton.isSelected = false
        }
    }
    
    private func selectPlusButton() {
        plusButton.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        plusButton.isSelected = true
    }
    
    private func selectMinusButton() {
        minusButton.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        minusButton.isSelected = true
    }
    
    private func selectEqualButton() {
        equalButton.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        equalButton.isSelected = true
    }
}

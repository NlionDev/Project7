//
//  OperatorsButtons.swift
//  CountOnMe
//
//  Created by Nicolas Lion on 19/02/2019.
//  Copyright © 2019 Ambroise Collon. All rights reserved.
//

import UIKit

protocol CalculatorViewDelegate: class {
    func getTag(didSelectButton tag: Int)
}

class CalculatorView: UIView {
    
    // MARK: - Outlets
    
    @IBOutlet private weak var plusButton: UIButton!
    @IBOutlet private weak var minusButton: UIButton!
    @IBOutlet private weak var equalButton: UIButton!
    
    // MARK: - Properties
    
    weak var delegate: CalculatorViewDelegate?
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setPlusButtons()
        setMinusButton()
        setEqualButton()
    }
    
    // MARK: - Actions
    
    @objc private func didTapButton(_ sender: UIButton) {
        delegate?.getTag(didSelectButton: sender.tag)
    }
    
    // MARK: - Methods
    
    func setSelectedStyleForButton(buttonTag: Int) {
        if buttonTag == 1 {
            plusButton.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            plusButton.isSelected = true
        } else if buttonTag == 2 {
        minusButton.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        minusButton.isSelected = true
        } else if buttonTag == 3 {
            equalButton.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            equalButton.isSelected = true
        }
    }
    
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
    
    private func setPlusButtons() {
        plusButton.tag = 1
        plusButton.layer.cornerRadius = 10
        plusButton.setTitleColor(#colorLiteral(red: 0.4691326092, green: 0.7149516575, blue: 0.6240751724, alpha: 1), for: .selected)
        plusButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    private func setMinusButton() {
        minusButton.tag = 2
        minusButton.layer.cornerRadius = 10
        minusButton.setTitleColor(#colorLiteral(red: 0.8751251101, green: 0.3733541965, blue: 0.3268560469, alpha: 1), for: .selected)
        minusButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    private func setEqualButton() {
        equalButton.tag = 3
        equalButton.layer.cornerRadius = 10
        equalButton.setTitleColor(#colorLiteral(red: 0.9439501166, green: 0.6425412893, blue: 0.1273810863, alpha: 1), for: .selected)
        equalButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
}

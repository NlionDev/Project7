//
//  TextView.swift
//  CountOnMe
//
//  Created by Nicolas Lion on 10/02/2019.
//  Copyright © 2019 Ambroise Collon. All rights reserved.
//

import UIKit

class TextView: UITextView {

    // MARK: - LifeCycle

    override func awakeFromNib() {
        super.awakeFromNib()

        backgroundColor = UIColor(red: 63.0/255.0, green: 136.0/255.0, blue: 150.0/255.0, alpha: 1)
        textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        layer.cornerRadius = 10
    }
}

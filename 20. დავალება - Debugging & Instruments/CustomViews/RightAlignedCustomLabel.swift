//
//  RightAlignedCustomLabel.swift
//  20. დავალება - Debugging & Instruments
//
//  Created by gvantsa gvagvalia on 4/22/24.
//

import UIKit

class RightAlignedCustomLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLabel()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureLabel() {
        translatesAutoresizingMaskIntoConstraints = false
        text = "Error"
        textAlignment = .right
        font = UIFont.systemFont(ofSize: 14)
        textColor = .label
        numberOfLines = 0
    }
}

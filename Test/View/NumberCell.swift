//
//  NumberCell.swift
//  Test
//
//  Created by Trevin Wisaksana on 14/12/18.
//  Copyright © 2018 Trevin Wisaksana. All rights reserved.
//

import UIKit

final class NumberCell: UITableViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var numberLabel: UILabel!
    
    // MARK: - Dependency Injection
    
    public var model: NumberViewModel? {
        didSet {
            if let model = model {
                numberLabel.text = "\(model.number)"
            }
        }
    }
    
}

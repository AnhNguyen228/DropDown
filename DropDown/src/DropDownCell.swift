//
//  DropDownCellTableViewCell.swift
//  DropDown
//
//  Created by Kevin Hirsch on 28/07/15.
//  Copyright (c) 2015 Kevin Hirsch. All rights reserved.
//

import UIKit

open class DropDownCell: UITableViewCell {
        
    //UI
    @IBOutlet open weak var optionLabel: UILabel!
    
    var selectedBackgroundColor: UIColor?
    var highlightTextColor: UIColor?
    var normalTextColor: UIColor?

}

//MARK: - UI

extension DropDownCell {
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = .white
//        self.layer.masksToBounds = false
//        self.layer.cornerRadius = 10
//        self.layer.shadowColor = UIColor.gray.cgColor
//        self.layer.shadowOffset = CGSize(width: 0, height: 0)
//        self.layer.shadowOpacity = 10
//        self.layer.shadowRadius = 10
    }
    
    override open var isSelected: Bool {
        willSet {
            setSelected(newValue, animated: false)
        }
    }
    
    override open var isHighlighted: Bool {
        willSet {
            setSelected(newValue, animated: false)
        }
    }
    
    override open func setHighlighted(_ highlighted: Bool, animated: Bool) {
        setSelected(highlighted, animated: animated)
    }
    
    override open func setSelected(_ selected: Bool, animated: Bool) {
        let executeSelection: () -> Void = { [weak self] in
            guard let `self` = self else { return }

            if let selectedBackgroundColor = self.selectedBackgroundColor {
                if selected {
                    self.backgroundColor = selectedBackgroundColor
                    self.optionLabel.textColor = self.highlightTextColor
                } else {
                    self.backgroundColor = .white
                    self.optionLabel.textColor = self.normalTextColor
                }
            }
        }
        
        if animated {
            UIView.animate(withDuration: 0.3, animations: {
                executeSelection()
            })
        } else {
            executeSelection()
        }

        accessibilityTraits = selected ? .selected : .none
    }
    
}

//
//  TextEntryCell.swift
//  Pecan
//
//  Created by Dan Williams on 09/08/2014.
//  Copyright (c) 2014 Dan Williams. All rights reserved.
//

import UIKit

class TextEntryCell: BaseTableViewCell {
    
    var cellLabel: UILabel = {
        let label = UILabel(forAutoLayout: ())
        label.font = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
        return label
    }()
    
    var textField: UITextField = {
        let textField = UITextField(forAutoLayout:())
        textField.placeholder = "Captain Placeholder"
        return textField
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(cellLabel)
        contentView.addSubview(textField)
        selectionStyle = .None
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        cellLabel.autoPinEdge(.Leading, toEdge: .Leading, ofView: contentView, withOffset:12)
        cellLabel.autoPinEdge(.Top, toEdge: .Top, ofView: contentView, withOffset: 10)
        cellLabel.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: contentView, withOffset: -10)
        cellLabel.autoSetDimension(.Width, toSize: 100)

        
        textField.autoPinEdge(.Left, toEdge: .Right, ofView: cellLabel, withOffset:10)
        textField.autoPinEdge(.Right, toEdge: .Right, ofView: contentView, withOffset:-10)
        textField.autoSetDimension(.Height, toSize: 44)
    }
    
    override class func requiresConstraintBasedLayout() -> Bool {
        return true
    }

}

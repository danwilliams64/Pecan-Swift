//
//  BaseTableViewCell.swift
//  Pecan
//
//  Created by Dan Williams on 09/08/2014.
//  Copyright (c) 2014 Dan Williams. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
    
    func reuseIdentifier() -> String {
        return self.reuseIdentifier()
    }
    
    class func reuseIdentifier() -> String {
        let classString = NSStringFromClass(self)
        let range = classString.rangeOfString(".", options: NSStringCompareOptions.CaseInsensitiveSearch, range: Range<String.Index>(start:classString.startIndex, end: classString.endIndex), locale: nil)
        return classString.substringFromIndex(range!.endIndex)
    }
}

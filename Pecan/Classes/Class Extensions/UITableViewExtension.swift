//
//  UITableViewExtension.swift
//  Pecan
//
//  Created by Dan Williams on 10/08/2014.
//  Copyright (c) 2014 Dan Williams. All rights reserved.
//

import Foundation

extension UITableView {
    /**
    *  Returns an NSIndexPath optional type, which includes the next indexPath after the one specified.
    *
    *  @param NSIndexPath The given indexPath
    *
    *  @return +1 after the given indexPath
    */
    func nextIndexPathForFormAfterIndexPath(indexPath: NSIndexPath) -> NSIndexPath? {
        let numberOfRowsInTableView = self.dataSource.tableView(self, numberOfRowsInSection: 0) - 1
        if indexPath.row < numberOfRowsInTableView {
            return NSIndexPath(forRow: indexPath.row + 1, inSection: 0)
        }
        
        return nil
    }
    
    func makeNextTextFieldBecomeFirstResponderAfterIndexPath(currentIndexPath: NSIndexPath) {
        if let nextIndexPath = self.nextIndexPathForFormAfterIndexPath(currentIndexPath) {
            let cell = self.cellForRowAtIndexPath(nextIndexPath) as TextEntryCell
            cell.textField.becomeFirstResponder()
        }
    }
    
    func indexPathForCellSubView(subView: UIView) -> NSIndexPath? {
        let point = self.convertPoint(subView.frame.origin, fromView: subView.superview)
        return self.indexPathForRowAtPoint(point)
    }
}

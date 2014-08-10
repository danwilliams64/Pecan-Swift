//
//  BaseTableViewController.swift
//  Pecan
//
//  Created by Dan Williams on 07/08/2014.
//  Copyright (c) 2014 Dan Williams. All rights reserved.
//

import UIKit

class BaseTableViewController: BaseViewController {
    
    let tableView = UITableView(frame: UIScreen.mainScreen().bounds, style: .Grouped)
    
    override func loadView() {
        let baseView = UIView(frame: UIScreen.mainScreen().bounds)
        baseView.addSubview(tableView)
        tableView.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsetsZero)
        view = baseView
    }
    
}

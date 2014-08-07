//
//  BaseTableViewController.swift
//  Pecan
//
//  Created by Dan Williams on 07/08/2014.
//  Copyright (c) 2014 Dan Williams. All rights reserved.
//

import UIKit

class BaseTableViewController: BaseViewController {
    
    lazy var tableView: UITableView = {
        return UITableView(frame: self.view.bounds, style: .Grouped)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
    }
}

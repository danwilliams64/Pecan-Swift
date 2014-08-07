//
//  WelcomeViewController.swift
//  Pecan
//
//  Created by Dan Williams on 07/08/2014.
//  Copyright (c) 2014 Dan Williams. All rights reserved.
//

import UIKit

class WelcomeViewController: BaseTableViewController {
    
    // MARK: - Properties
    
    let cellIdentifier = "WelcomeTextCell"
    var dataSource: ArrayDataSource = {
       let dataSource = ArrayDataSource(items: ["Sign In", "New Account"], cellIdentifier: "WelcomeTextCell", configurationBlock: { (cell, item) -> () in
        let tableViewCell = cell as UITableViewCell
        tableViewCell.textLabel.text = item as String
       })
        return dataSource
    }()
    
    // MARK: - UIViewController

    override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        title = "Welcome"
    }
    
    override func viewDidLoad() {
        setUpTableView()
        super.viewDidLoad()
    }
    
    // MARK: - Private

    private func setUpTableView() {
        tableView.tableHeaderView = WelcomeTableViewHeaderView(frame: CGRectMake(0, 0, CGRectGetWidth(tableView.frame), 250.0))
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.dataSource = dataSource
    }
}

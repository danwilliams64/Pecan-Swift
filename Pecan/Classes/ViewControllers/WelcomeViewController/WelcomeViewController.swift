//
//  WelcomeViewController.swift
//  Pecan
//
//  Created by Dan Williams on 07/08/2014.
//  Copyright (c) 2014 Dan Williams. All rights reserved.
//

import UIKit

class WelcomeViewController: BaseTableViewController, UITableViewDelegate {
    
    // MARK: - Properties
    
    let cellIdentifier = "WelcomeTextCell"
    var dataSource: ArrayDataSource = {
       let dataSource = ArrayDataSource(items: ["Sign In", "New Account"], cellIdentifier: "WelcomeTextCell", configurationBlock: { (cell, item) -> () in
        let tableViewCell = cell as UITableViewCell
        tableViewCell.textLabel.text = item as String
        tableViewCell.accessoryType = .DisclosureIndicator
       })
        return dataSource
    }()
    
    // MARK: - UIViewController

    override init() {
        super.init(nibName: nil, bundle: nil)
        title = "Welcome"
    }
    
    override func viewDidLoad() {
        setUpTableView()
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        tableView.deselectRowAtIndexPath(tableView.indexPathForSelectedRow(), animated: true)
    }
    
    // MARK: - Private

    private func setUpTableView() {
        tableView.tableHeaderView = WelcomeTableViewHeaderView(frame: CGRectMake(0, 0, CGRectGetWidth(tableView.frame), 250.0))
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.dataSource = dataSource
        tableView.delegate = self
    }
    
    // MARK: - TableView Delegate
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        switch indexPath.row {
            case 1:
                splitViewController .showDetailViewController(RegisterViewController(), sender: nil)
            default:
                println("Default")
        }
    }
}

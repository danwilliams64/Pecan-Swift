//
//  WelcomeViewController.swift
//  Pecan
//
//  Created by Dan Williams on 07/08/2014.
//  Copyright (c) 2014 Dan Williams. All rights reserved.
//

import UIKit

let kTableHeaderViewHeightRegular: CGFloat = 275.0
let kTableHeaderViewHeightCompact: CGFloat = 150.0

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
    
    override init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
        title = "Welcome"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
    }
    
    override func viewWillAppear(animated: Bool) {
        tableView.deselectRowAtIndexPath(tableView.indexPathForSelectedRow(), animated: true)
    }
    
    override func traitCollectionDidChange(previousTraitCollection: UITraitCollection!) {
        super.traitCollectionDidChange(previousTraitCollection)
        let tableHeaderView = tableView.tableHeaderView as WelcomeTableViewHeaderView
        var newHeaderHeight: CGFloat = 0;
        
        if traitCollection.verticalSizeClass == .Compact {
            newHeaderHeight = kTableHeaderViewHeightCompact
        } else {
            newHeaderHeight = kTableHeaderViewHeightRegular
        }
        
        tableHeaderView.frame = CGRectMake(0, 0, CGRectGetWidth(tableHeaderView.frame), newHeaderHeight)
        tableView.tableHeaderView = tableHeaderView // Needs to re-assign this for the height change to take effect
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
            case 0:
                splitViewController.showDetailViewController(LoginViewController(coder: nil), sender: nil)
            case 1:
                splitViewController.showDetailViewController(RegisterViewController(coder: nil), sender: nil)
            default:
                println("Default")
        }
    }
}

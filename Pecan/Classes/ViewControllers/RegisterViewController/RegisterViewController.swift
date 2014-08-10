//
//  RegisterViewController.swift
//  Pecan
//
//  Created by Dan Williams on 08/08/2014.
//  Copyright (c) 2014 Dan Williams. All rights reserved.
//

import UIKit

class RegisterViewController: BaseTableViewController {
    
    // MARK: - Properties
    var dataSource: ArrayDataSource = {
        let dataSource = ArrayDataSource(items: ["Email", "Password", "Name"], cellIdentifier: TextEntryCell.reuseIdentifier(), configurationBlock: { (cell, item) -> () in
            let textEntryCell = cell as TextEntryCell
            textEntryCell.cellLabel.text = item as String
            textEntryCell.textField.placeholder = item as String
        })
        
        return dataSource
    }()

    var forgottenPasswordButton: UIButton = {
        let button: AnyObject! = UIButton.buttonWithType(.System)
        button.setTitle("Forgotten your password?", forState: .Normal)
        button.setTitleColor(UIApplication.sharedApplication().keyWindow.tintColor, forState: .Normal)
        return button as UIButton
    }()
    
    override init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
        title = "New Account"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Create", style: .Done, target: self, action: "createButtonTapped:")
    }
    
    // MARK: - Private
    
    private func setUpTableView() {
        tableView.registerClass(TextEntryCell.self, forCellReuseIdentifier: TextEntryCell.reuseIdentifier())
        tableView.dataSource = dataSource
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.tableFooterView = forgottenPasswordButton
        forgottenPasswordButton.frame = CGRectMake(0, 0, CGRectGetWidth(tableView.frame), 44)
        forgottenPasswordButton.titleLabel.textAlignment = .Center
    }
    
    private func createButtonTapped(sender: UIBarButtonItem) {
        NSLog("Button title: \(sender.title)")
    }
}

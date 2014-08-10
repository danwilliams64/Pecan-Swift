//
//  LoginViewController.swift
//  Pecan
//
//  Created by Dan Williams on 10/08/2014.
//  Copyright (c) 2014 Dan Williams. All rights reserved.
//

import UIKit

class LoginViewController: BaseTableViewController {
    
    // MARK: - Properties
    
    var dataSource: ArrayDataSource = {
        let dataSource = ArrayDataSource(items: ["Email", "Password"], cellIdentifier: TextEntryCell.reuseIdentifier(), configurationBlock: { (cell, item) -> () in
            let textEntryCell = cell as TextEntryCell
            textEntryCell.cellLabel.text = item as String
            textEntryCell.textField.placeholder = item as String
        })
        return dataSource
    }()
    
    // MARK: - Initializer
    
    override init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
        title = "Pecan"
    }

    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sign In", style: .Done, target: self, action: "signInButtonTapped:")
    }
    
    // MARK: - Private
    
    private func signInButtonTapped(sender: UIBarButtonItem) {
        println("sign in button tapped")
    }
    
    private func setUpTableView() {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.dataSource = dataSource
        tableView.registerClass(TextEntryCell.self, forCellReuseIdentifier: TextEntryCell.reuseIdentifier())
    }

}

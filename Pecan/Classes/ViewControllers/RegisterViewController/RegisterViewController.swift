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
        let dataSource = ArrayDataSource(items: ["Email", "Password"], cellIdentifier: TextEntryCell.reuseIdentifier(), configurationBlock: { (cell, item) -> () in
            let textEntryCell = cell as TextEntryCell
            textEntryCell.cellLabel.text = item as String
            textEntryCell.textField.placeholder = item as String
        })
        
        return dataSource
    }()
    
    override init() {
        super.init(nibName: nil, bundle: nil)
        title = "New Account"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Create", style: .Done, target: self, action: "createButtonTapped:")
    }
    
    // MARK: - Private
    
    func setUpTableView() {
        tableView.registerClass(TextEntryCell.self, forCellReuseIdentifier: TextEntryCell.reuseIdentifier())
        tableView.dataSource = dataSource
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    func createButtonTapped(sender: UIBarButtonItem) {
        NSLog("Button title: \(sender.title)")
    }
}

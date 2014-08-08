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
        let dataSource = ArrayDataSource(items: ["Email", "Password"], cellIdentifier: "RegisterCell", configurationBlock: { (cell, item) -> () in
            cell.textLabel.text = item as String
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
    }
    
    // MARK: - Private
    
    func setUpTableView() {
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "RegisterCell")
        tableView.dataSource = dataSource
    }
}

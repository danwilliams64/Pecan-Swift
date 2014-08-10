//
//  LoginViewController.swift
//  Pecan
//
//  Created by Dan Williams on 10/08/2014.
//  Copyright (c) 2014 Dan Williams. All rights reserved.
//

import UIKit

class LoginViewController: BaseTableViewController, UITextFieldDelegate {
    
    // MARK: - Properties
    
    var dataSource: ArrayDataSource?
    
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
    
    // MARK: - UITextField Delegate
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        if let currentIndexPath = tableView.indexPathForCellSubView(textField) {
            tableView.makeNextTextFieldBecomeFirstResponderAfterIndexPath(currentIndexPath)
        }
    
        return true
    }
    
    // MARK: - Private
    
    func signInButtonTapped(sender: UIBarButtonItem) {
        ProgressHUD.show("Signing in", interaction: false)
    }
    
    private func setUpTableView() {
        dataSource = ArrayDataSource(items: ["Email", "Password"], cellIdentifier: TextEntryCell.reuseIdentifier(), configurationBlock: { (cell, item) -> () in
            let textEntryCell = cell as TextEntryCell
            textEntryCell.cellLabel.text = item as String
            textEntryCell.textField.placeholder = item as String
            textEntryCell.textField.delegate = self
            
            if item as String == "Password" {
                textEntryCell.textField.secureTextEntry = true
            }
        })
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.dataSource = dataSource
        tableView.registerClass(TextEntryCell.self, forCellReuseIdentifier: TextEntryCell.reuseIdentifier())
        tableView.keyboardDismissMode = .OnDrag
    }

}

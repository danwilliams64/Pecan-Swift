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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "onContentSizeChange:", name: UIContentSizeCategoryDidChangeNotification, object: nil)
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    func onContentSizeChange(notification: NSNotification) {
        tableView.reloadData()
    }
    
}

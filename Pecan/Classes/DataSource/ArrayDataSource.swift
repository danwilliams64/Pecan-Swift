//
//  ArrayDataSource.swift
//  Pecan
//
//  Created by Dan Williams on 07/08/2014.
//  Copyright (c) 2014 Dan Williams. All rights reserved.
//

class ArrayDataSource: NSObject, UITableViewDataSource {
    
    typealias ArrayDataSourceTableViewConfigurationBlock = (cell: UITableViewCell, item: AnyObject) -> ()
    
    var items: [AnyObject] = []
    var cellIdentifier: String = ""
    var configurationBlock: ArrayDataSourceTableViewConfigurationBlock
    
    init(items: [AnyObject], cellIdentifier: String, configurationBlock: ArrayDataSourceTableViewConfigurationBlock) {
        self.items = items
        self.cellIdentifier = cellIdentifier
        self.configurationBlock = configurationBlock
    }
    
    func itemAtIndexPath(indexPath: NSIndexPath) -> AnyObject {
        return items[indexPath.row]
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as UITableViewCell
        
        let item: AnyObject = itemAtIndexPath(indexPath) as AnyObject
        configurationBlock(cell: cell, item: item)
        return cell
    }
}

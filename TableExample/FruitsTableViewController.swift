//
//  FruitsTableViewController.swift
//  TableExample
//
//  Created by Ralf Ebert on 27/04/15.
//  Copyright (c) 2015 Example. All rights reserved.
//

import UIKit

class FruitsTableViewController: UITableViewController {

    var data = ["Apple", "Apricot", "Banana", "Blueberry", "Cantaloupe", "Cherry", "Clementine", "Coconut", "Cranberry", "Fig", "Grape", "Grapefruit", "Kiwi fruit", "Lemon", "Lime", "Lychee", "Mandarine", "Mango", "Melon", "Nectarine", "Olive", "Orange", "Papaya", "Peach", "Pear", "Pineapple", "Raspberry", "Strawberry"]
    
    // MARK: - UIViewController lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.editing = true
    }
    
    // MARK: - UITableViewDataSource
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("FruitCell", forIndexPath: indexPath) 
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    
    override func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        return .None
    }
    
    override func tableView(tableView: UITableView, shouldIndentWhileEditingRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }
    
    override func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        let movedObject = self.data[sourceIndexPath.row]
        data.removeAtIndex(sourceIndexPath.row)
        data.insert(movedObject, atIndex: destinationIndexPath.row)
        NSLog("%@", "\(sourceIndexPath.row) => \(destinationIndexPath.row) \(data)")
        // To check for correctness enable:  self.tableView.reloadData()
    }

    
}
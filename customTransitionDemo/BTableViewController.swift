//
//  BTableViewController.swift
//  customTransitionDemo
//
//  Created by Onet away on 2/6/15.
//  Copyright (c) 2015 Onet away. All rights reserved.
//

import UIKit

class BTableViewController: UITableViewController {

    var cellTexts = ["B cell 0", "B cell 1", "B cell 2"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "View Controller B"
        tableView.tableFooterView = UIView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return cellTexts.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("View B Cell", forIndexPath: indexPath) as UITableViewCell

        cell.textLabel?.text = cellTexts[indexPath.row]
        cell.backgroundColor = UIColor.blueColor()
        return cell
    }



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}

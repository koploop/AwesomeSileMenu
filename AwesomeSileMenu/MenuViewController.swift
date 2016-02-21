//
//  MenuViewController.swift
//  AwesomeSileMenu
//
//  Created by ErosLii on 16/2/20.
//  Copyright © 2016年 weelh. All rights reserved.
//

import UIKit

class MenuViewController: UITableViewController {
    
    // MARK: - lazy
    lazy var menuItems:NSArray = {
        let path = NSBundle.mainBundle().pathForResource("MenuItems", ofType: "plist")
        return NSArray(contentsOfFile: path!)!
    }()

    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.navigationBar.clipsToBounds = true
        (self.navigationController!.parentViewController as! ContainerViewController).menuItem = (menuItems[0] as! NSDictionary)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MenuItemCell") as! MenuItemCell
        let menuItem = menuItems[indexPath.row] as! NSDictionary
        cell.configureForMenuItem(menuItem)
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return max(80, CGRectGetHeight(view.bounds) / CGFloat(menuItems.count))
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let menuItem = self.menuItems[indexPath.row] as! NSDictionary
        (self.navigationController!.parentViewController as! ContainerViewController).menuItem = menuItem
    }
    
//    // MARK: Segues
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if segue.identifier == "showDetail" {
//            if let indexPath = self.tableView.indexPathForSelectedRow {
//                let object = menuItems[indexPath.row] as! NSDictionary
//                (segue.destinationViewController as! DetailViewController).menuItem = object
//            }
//        }
//    }

}

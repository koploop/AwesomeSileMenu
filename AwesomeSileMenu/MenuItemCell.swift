//
//  MenuItemCell.swift
//  AwesomeSileMenu
//
//  Created by ErosLii on 16/2/20.
//  Copyright © 2016年 weelh. All rights reserved.
//

import UIKit

class MenuItemCell: UITableViewCell {
    
    @IBOutlet weak var menuItemImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureForMenuItem(menuitem:NSDictionary) {
        menuItemImageView.image = UIImage(named: menuitem["image"] as! String)
        backgroundColor = UIColor(colorArray: menuitem["colors"] as! NSArray)
        
        //设置cell分割线缩进为0
        separatorInset = UIEdgeInsetsZero
        preservesSuperviewLayoutMargins = false
        layoutMargins = UIEdgeInsetsZero
    }

}

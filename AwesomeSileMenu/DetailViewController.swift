//
//  DetailViewController.swift
//  AwesomeSileMenu
//
//  Created by ErosLii on 16/2/20.
//  Copyright © 2016年 weelh. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var backImageView: UIImageView!
    
    var hamburgerView:HamburgerView?
    
    var menuItem:NSDictionary? {
        didSet {
            if let newMenuIem = menuItem {
                view.backgroundColor = UIColor(colorArray: newMenuIem["colors"] as! NSArray)
                backImageView?.image = UIImage(named: newMenuIem["bigImage"] as! String)
            }
        }
    }
    
    //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        //这个的作用是消除navigationbar下面的一条特别细的线.
        self.navigationController!.navigationBar.clipsToBounds = true
        //添加汉堡包按钮
        let tap = UITapGestureRecognizer(target: self, action: "hamburgerViewTaped")
        hamburgerView = HamburgerView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        hamburgerView!.addGestureRecognizer(tap)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: hamburgerView!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    //MARK: - Action
    func hamburgerViewTaped() {
        let navigationController = self.parentViewController as! UINavigationController
        let containerViewController = navigationController.parentViewController as! ContainerViewController
        containerViewController.hideOrShowMenu(!containerViewController.showMenu, animated: true)
    }
}

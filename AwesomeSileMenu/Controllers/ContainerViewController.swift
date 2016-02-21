//
//  ContainerViewController.swift
//  AwesomeSileMenu
//
//  Created by ErosLii on 16/2/20.
//  Copyright © 2016年 weelh. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController,UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var menuContainerView: UIView!
    private var detailViewController:DetailViewController?
    //记录菜单的展开收起状态
    var showMenu = false
    var menuItem:NSDictionary? {
        didSet {
            if let newDetailViewController = detailViewController {
                newDetailViewController.menuItem = menuItem
                hideOrShowMenu(false, animated:true)
            }
        }
    }
    
    //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
//        automaticallyAdjustsScrollViewInsets = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        hideOrShowMenu(self.showMenu, animated: false)
        //
        menuContainerView.layer.anchorPoint = CGPoint(x: 1.0, y: 0.5)
    }
    
    //MARK: - private method
    func hideOrShowMenu(show:Bool, animated:Bool) {
        let menuOffset = CGRectGetWidth(self.menuContainerView.bounds)
        self.scrollView.setContentOffset(show ? CGPointZero : CGPoint(x:menuOffset, y:0), animated: animated)
        self.showMenu = show
    }
    
    func transformForFraction(fraction:CGFloat) -> CATransform3D {
        var identity = CATransform3DIdentity
        identity.m34 = -1.0 / 1000.0;
        let angle = Double(1.0 - fraction) * -M_PI_2
        let xOffset = CGRectGetWidth(menuContainerView.bounds) * 0.5
        let rotateTransform = CATransform3DRotate(identity, CGFloat(angle), 0.0, 1.0, 0.0)
        let translateTransform = CATransform3DMakeTranslation(xOffset, 0.0, 0.0)
        return CATransform3DConcat(rotateTransform, translateTransform)
    }
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "DetailViewSegue" {
            let navigationController = segue.destinationViewController as! UINavigationController
            detailViewController = navigationController.topViewController as? DetailViewController
        }
    }
    
    //MARK: - ScrollViewDelegate
    func scrollViewDidScroll(scrollView: UIScrollView) {
        scrollView.pagingEnabled = scrollView.contentOffset.x < (scrollView.contentSize.width - CGRectGetWidth(scrollView.frame))
        
        //手动滑动时更新showMenu的值
        let menuOffset = CGRectGetWidth(menuContainerView.bounds)
        self.showMenu = !CGPointEqualToPoint(CGPoint(x: menuOffset, y: 0), scrollView.contentOffset)
        
        //增加透视效果
        let multiplier = 1.0 / CGRectGetWidth(menuContainerView.bounds)
        let offset = scrollView.contentOffset.x * multiplier
        let fraction = 1.0 - offset
        menuContainerView.layer.transform = transformForFraction(fraction)
        menuContainerView.alpha = fraction
        
        //让汉堡包按钮动起来
        if let detailViewController = detailViewController {
            if let newHamburgerView = detailViewController.hamburgerView {
                newHamburgerView.hamburgerRotate(fraction)
            }
        }

    }
    
//    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
//        let menuOffset = CGRectGetWidth(menuContainerView.bounds)
//        self.showMenu = !CGPointEqualToPoint(CGPoint(x: menuOffset, y: 0), scrollView.contentOffset)
//    }
    
    
    

}

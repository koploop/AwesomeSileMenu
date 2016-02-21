//
//  HamburgerView.swift
//  AwesomeSileMenu
//
//  Created by ErosLii on 16/2/21.
//  Copyright © 2016年 weelh. All rights reserved.
//

import UIKit

class HamburgerView: UIView {
    
    let imageView:UIImageView! = UIImageView(image: UIImage(named: "Hamburger"))
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    private func configure() {
        self.imageView.contentMode = UIViewContentMode.Center
        addSubview(self.imageView)
    }
    
    func hamburgerRotate(fraction:CGFloat) {
        let angle = Double(fraction) * M_PI_2
        self.imageView.transform = CGAffineTransformMakeRotation(CGFloat(angle))
    }

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}

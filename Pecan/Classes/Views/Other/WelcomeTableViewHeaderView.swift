//
//  WelcomeTableViewHeaderView.swift
//  Pecan
//
//  Created by Dan Williams on 07/08/2014.
//  Copyright (c) 2014 Dan Williams. All rights reserved.
//

import UIKit

class WelcomeTableViewHeaderView: UIView {

    let imageView = UIImageView(image: UIImage(named: "pecan_logo"))
    
    required init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        imageView.autoCenterInSuperview()
    }
}

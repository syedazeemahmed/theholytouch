//
//  UIImageExtension.swift
//  tmb
//
//  Created by HansaMAC on 9/13/17.
//  Copyright © 2017 Cloud Asset Inc. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    @objc func changeImageColor( color:UIColor) -> UIImage
    {
        image = image!.withRenderingMode(.alwaysTemplate)
        tintColor = color
        return image!
    }
    
    
    @objc func setImageCornersRound() {
        
        // Main Border around text field container
        self.layoutIfNeeded()
        self.layer.cornerRadius = self.frame.height/2
        self.layer.masksToBounds = true
    }
}


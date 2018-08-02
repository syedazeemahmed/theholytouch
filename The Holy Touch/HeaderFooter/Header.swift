//
//  Header.swift
//  The Holy Touch
//
//  Created by HansaMAC on 8/2/18.
//  Copyright © 2018 Hajj Hackathon. All rights reserved.
//

import Foundation
import UIKit

class Header : UIView {
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var TitleLabel: UILabel!
    var parentPointer: UIViewController?
    @IBOutlet weak var leftButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
        setup()
    }
    
    public func setup() {
        Bundle.main.loadNibNamed("Header", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.TitleLabel.textColor = AppConstants.themeSecondary
    }
    
    
}

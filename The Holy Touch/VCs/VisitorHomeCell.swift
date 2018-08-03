//
//  VisitorHomeCell.swift
//  The Holy Touch
//
//  Created by HansaMAC on 8/2/18.
//  Copyright © 2018 Hajj Hackathon. All rights reserved.
//

import UIKit

class VisitorHomeCell : UITableViewCell {
    
    @IBOutlet weak var SessionNameLabel: UILabel!
    @IBOutlet weak var sessionTImings: UILabel!
    @IBOutlet weak var reamingSlot: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //_ = self.trxnTypeImage.changeImageColor(color: AppConstants.appPrimaryColor)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

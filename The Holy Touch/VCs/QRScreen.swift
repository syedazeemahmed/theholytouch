//
//  QRScreen.swift
//  The Holy Touch
//
//  Created by HansaMAC on 8/3/18.
//  Copyright © 2018 Hajj Hackathon. All rights reserved.
//

import Foundation
import Foundation
import UIKit


class QRScreen : UIViewController, AMScanViewControllerDelegate {
    
    @IBOutlet weak var headView: Header!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        
        
        // Navigation Adjusments
        self.headView.TitleLabel.text = "Your Reservation"
//        let logoutImage = UIImage(named: "back")
//        headView.leftButton.setImage(logoutImage, for: .normal)
//        headView.leftButton.addTarget(self, action: #selector(self.logout), for: .touchUpInside)
//        _ = headView.leftButton.imageView?.changeImageColor(color: AppConstants.themeSecondary)
        
    }
    
    @objc func logout() {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
    }

}

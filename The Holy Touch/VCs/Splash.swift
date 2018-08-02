//
//  Splash.swift
//  The Holy Touch
//
//  Created by HansaMAC on 8/2/18.
//  Copyright © 2018 Hajj Hackathon. All rights reserved.
//

import Foundation
import UIKit

class Splash : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        perform(#selector(self.toNext), with: nil, afterDelay: 3.0)
        
    }
    
    @objc func toNext () {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc1: IndexPage? = (storyboard.instantiateViewController(withIdentifier: "LandingPage") as? IndexPage)
        self.navigationController?.pushViewController(vc1!, animated: true)

    }
    
}

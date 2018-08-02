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
        
        perform(#selector(self.checkFirstTimeLogin), with: nil, afterDelay: 5.0)
        
    }
    
    @objc func checkFirstTimeLogin () {
        
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let vc1: IndexPage? = (storyboard.instantiateViewController(withIdentifier: "IndexPage") as? IndexPage)
        self.navigationController?.pushViewController(vc1!, animated: true)

    }
    
}

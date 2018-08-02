//
//  Index.swift
//  The Holy Touch
//
//  Created by HansaMAC on 8/2/18.
//  Copyright © 2018 Hajj Hackathon. All rights reserved.
//

import Foundation
import UIKit

class IndexPage : UIViewController {
    @IBOutlet weak var visitorButton: UIButton!
    @IBOutlet weak var adminButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        visitorButton.layer.cornerRadius = visitorButton.frame.size.height/2
        adminButton.layer.cornerRadius = adminButton.frame.size.height/2
    }
    
    @IBAction func visitorsogin(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc1: Login? = (storyboard.instantiateViewController(withIdentifier: "Login") as? Login)
        vc1?.loginType = AppConstants.incomingClass.visitorLogin
        self.navigationController?.pushViewController(vc1!, animated: true)

    }
    
    @IBAction func adminLogin(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc1: Login? = (storyboard.instantiateViewController(withIdentifier: "Login") as? Login)
        vc1?.loginType = AppConstants.incomingClass.adminLogin
        self.navigationController?.pushViewController(vc1!, animated: true)

    }
    
    @objc func checkFirstTimeLogin () {
        
//        let storyboard = UIStoryboard(name: "Home", bundle: nil)
//        let vc1: IndexPage? = (storyboard.instantiateViewController(withIdentifier: "IndexPage") as? IndexPage)
//        self.navigationController?.pushViewController(vc1!, animated: true)
        
    }
    
}

//
//  Login.swift
//  The Holy Touch
//
//  Created by HansaMAC on 8/2/18.
//  Copyright © 2018 Hajj Hackathon. All rights reserved.
//

import Foundation
import Foundation
import UIKit

class Login : UIViewController {
    
    
    @IBOutlet weak var headView: Header!
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    var loginType : String?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        
        
        // Navigation Adjusments
        self.headView.TitleLabel.text = "Login"
        let logoutImage = UIImage(named: "back")
        headView.leftButton.setImage(logoutImage, for: .normal)
        headView.leftButton.addTarget(self, action: #selector(self.logout), for: .touchUpInside)
        _ = headView.leftButton.imageView?.changeImageColor(color: AppConstants.themeSecondary)

    }
    
    @objc func logout() {
        self.navigationController?.popViewController(animated: true)
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        usernameField.layer.cornerRadius = usernameField.frame.size.height/2
        usernameField.layer.borderColor = AppConstants.themeSecondary.cgColor
        usernameField.layer.borderWidth = 1.0
        passwordField.layer.cornerRadius = passwordField.frame.size.height/2
        passwordField.layer.borderColor = AppConstants.themeSecondary.cgColor
        passwordField.layer.borderWidth = 1.0
        loginButton.layer.cornerRadius   = loginButton.frame.size.height/2
    }
    
    @IBAction func loginPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if (loginType == AppConstants.incomingClass.adminLogin) {
            let vc1: AdminHome? = (storyboard.instantiateViewController(withIdentifier: "AdminHome") as? AdminHome)
            self.navigationController?.pushViewController(vc1!, animated: true)
        }
        else {
            Utility.shared().simpleAlertView(withTitle: "", andMessage: "Take me to Visitor Home")
        }

    }
    
}

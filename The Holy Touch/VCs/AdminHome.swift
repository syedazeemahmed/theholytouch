//
//  AdminHome.swift
//  The Holy Touch
//
//  Created by HansaMAC on 8/2/18.
//  Copyright © 2018 Hajj Hackathon. All rights reserved.
//

import Foundation
import Foundation
import UIKit


class AdminHome : UIViewController, AMScanViewControllerDelegate {
    
    var readFromQR : Bool = false
    
    @IBOutlet weak var scanNowButton: UIButton!
    
    @IBOutlet weak var headView: Header!
    
    @IBOutlet weak var visitorsCount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        
        
        // Navigation Adjusments
        self.headView.TitleLabel.text = "Home"
        
        self.headView.rightButton.isHidden = false
        headView.rightButton.addTarget(self, action: #selector(self.addNewSession), for: .touchUpInside)
        
        let logoutImage = UIImage(named: "logout-icon")
        headView.leftButton.setImage(logoutImage, for: .normal)
        headView.leftButton.addTarget(self, action: #selector(self.logout), for: .touchUpInside)
        _ = headView.leftButton.imageView?.changeImageColor(color: AppConstants.themeSecondary)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.isHidden = true
        scanNowButton.layer.cornerRadius   = scanNowButton.frame.size.height/2
    }
    
    @IBAction func scanPressed(_ sender: Any) {
        let lvc = AMScanViewController()
        lvc.delegate = self
        self.navigationController?.pushViewController(lvc, animated: true)

//        Utility.shared().simpleAlertView(withTitle: "Alert", andMessage: "Feature Under Development")
    }
    
    @objc func addNewSession() {
        Utility.shared().simpleAlertView(withTitle: "Add New Session", andMessage: "Feature Under Development. Thank you for your patience\n Team Pakistan :)")
    }
    
    @objc func logout() {
        
        let alertViewController = UIAlertController(title: "Please Confirm", message: "Are you sure, you want to logout?", preferredStyle: .alert)
        let yes = UIAlertAction(title: "Yes", style: .default, handler: { (alert) in
            
            for controller in self.navigationController!.viewControllers as Array {
                if controller.isKind(of: Login.self) {
                    self.navigationController!.popToViewController(controller, animated: true)
                    break
                }
            }
            
        })
        let cancel = UIAlertAction(title: "No", style: .cancel) { (alert) in
            // do nothing
        }
        alertViewController.addAction(yes)
        
        alertViewController.addAction(cancel)
        self.present(alertViewController, animated: true, completion: nil)
        
    }
    
    func scanViewController(_ aCtler: AMScanViewController!, didSuccessfullyScan aScannedValue: String!) {
        print (aScannedValue)
        if (aScannedValue.count == 0) {
            print ("Invalid QR")
        }
        else if (aScannedValue.count > 0) {
            aCtler.stopScanning()
            self.readFromQR = true
            aCtler.navigationController?.popViewController(animated: true)
            self.validateQR(aScannedValue: aScannedValue)
        }
    }
    
    func validateQR (aScannedValue : String) {
        
        let _ : [AnyHashable: Any] = ["qr_data": aScannedValue]
        visitorsCount.text = "1 / 100";
        Utility.shared().simpleAlertView(withTitle: "Success", andMessage: "Access Granted")
        
        // send api call to the server
    }
}

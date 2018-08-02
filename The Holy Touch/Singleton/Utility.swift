//
//  Utility.swift
//  The Holy Touch
//
//  Created by HansaMAC on 8/2/18.
//  Copyright © 2018 Hajj Hackathon. All rights reserved.
//

import Foundation
import UIKit

class Utility: NSObject {
    
    @objc static var sharedUtility: Utility? = nil
    
    @objc class func shared() -> Utility {
        
        let lockQueue = DispatchQueue(label: "self")
        lockQueue.sync {
            
            if sharedUtility == nil {
                
                sharedUtility = Utility()
                
            }
        }
        
        return sharedUtility!
    }
    
    @objc func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    @objc func simpleAlertView(withTitle: String, andMessage: String) {
        let alertView = UIAlertController(title: withTitle,
                                          message: andMessage,
                                          preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alertView.addAction(okAction)
        self.topMostController().present(alertView, animated: true)
    }
    
    func simpleAlertViewWithBlock(withTitle: String, andMessage: String, andBlock block: @escaping (_ someBoolean: Bool?) -> Void) {
        let alertView = UIAlertController(title: withTitle,
                                          message: andMessage,
                                          preferredStyle: .alert)
        let yes = UIAlertAction(title: "OK", style: .default, handler: { (alert) in
            block(true)
        })
        alertView.addAction(yes)
        self.topMostController().present(alertView, animated: true)
    }
    
    @objc func topMostController() -> UIViewController {
        var topController: UIViewController? = UIApplication.shared.keyWindow?.rootViewController
        while ((topController?.presentedViewController) != nil) {
            topController = topController?.presentedViewController
        }
        return topController!
    }
    
    
    
    
}


//
//  File.swift
//  The Holy Touch
//
//  Created by HansaMAC on 8/2/18.
//  Copyright © 2018 Hajj Hackathon. All rights reserved.
//

import Foundation
import UIKit



struct AppConstants {
    
    private struct Alphas {
        static let Opaque = CGFloat(1)
        static let SemiOpaque = CGFloat(0.8)
        static let SemiTransparent = CGFloat(0.5)
        static let Transparent = CGFloat(0.3)
    }
    
    struct fontUsed {
        static let secondaryFont = "HelveticaNeueLT-Roman"
        static let primaryFont = "HelveticaLT-Light"
    }
    
    static let DominantColor = UIColor(red: 59/255.0, green: 203/255.0, blue: 194/255.0, alpha: 1)
    
    static let themePrimaryColor = UIColor(red: 70/255.0, green: 169/255.0, blue: 75/255.0, alpha: 1)
    static let themeSecondary = UIColor(red: 211/255.0, green: 152/255.0, blue: 49/255.0, alpha: 1)
    
    static let minorColor = UIColor.white
    
    static let appPrimaryColor = DominantColor.withAlphaComponent(Alphas.Opaque)
    static let appSecondaryColor = minorColor.withAlphaComponent(Alphas.Opaque)
    
    struct circleIconColors {
        static let iconColor = AppConstants.appPrimaryColor
        static let iconSelected = AppConstants.appSecondaryColor
        
    }
    
    
    
    struct TabBarColors{
        static let Selected = UIColor.white
        static let NotSelected = UIColor.black
        
    }
    
    struct OverlayColor {
        static let SemiTransparentBlack = UIColor.black.withAlphaComponent(Alphas.Transparent)
        static let SemiOpaque = UIColor.black.withAlphaComponent(Alphas.SemiOpaque)
        static let demoOverlay = UIColor.black.withAlphaComponent(0.6)
    }
    
    struct ProjectSetting {

        static let baseUrl  = "url..."
        static let host     = "url..."

        static let mobile_timezone = TimeZone.current.identifier
        static let locale_value : NSArray = UserDefaults.standard.value(forKey: "AppleLanguages") as! NSArray
        static let uuidValue = UIDevice.current.identifierForVendor!.uuidString
        static let osVersionValue = UIDevice.current.systemVersion
        static let xChannelValue = "ios"
    }
    
    struct ApiURL {
        static let login_api  = "/users/authenticate"
    }
    
    enum incomingClass {
        static let visitorLogin = "visitor"
        static let adminLogin = "admin"
    }
    
    /*
     
     Example of using Dispatch Queue
     
     let main = DispatchQueue.main
     let background = DispatchQueue.global()
     let helper = DispatchQueue(label: "construction_worker_3")
     
     func doSyncWork() { // Async will make sure to run each other in parallel
     background.async { for _ in 1...3 { print("Light") } } // this is running on background thread
     for _ in 1...3 { print("Heavy") } // this is running on main thread
     
     } // main
     
     doSyncWork()
     
     let asianWorker = DispatchQueue(label: "construction_worker_1")
     let brownWorker = DispatchQueue(label: "construction_worker_2")
     func doLightWork() {
     asianWorker.async { for _ in 1...10 { print("👷") } }
     brownWorker.async { for _ in 1...10 { print("👷🏽") } }
     
     }
     doLightWork()
     
     
     */
    
}

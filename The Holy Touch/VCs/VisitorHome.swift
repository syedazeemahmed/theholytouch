//
//  VisitorHome.swift
//  The Holy Touch
//
//  Created by HansaMAC on 8/2/18.
//  Copyright © 2018 Hajj Hackathon. All rights reserved.
//

import Foundation

class VisitorHome : UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var segmentControll: UISegmentedControl!
    
    var lastSelection : NSIndexPath?
    
    @IBOutlet weak var headView: Header!
    var maleArray : NSMutableArray = [
        ["name": "Session #1", "time" : "Friday: 7:00 PM - 7:15 PM", "remaining" : "25/150", "isActive" : true, "type" : "m"],
        ["name": "Session #2", "time" : "Saturday: 9:00 PM - 9:15 PM", "remaining" : "99/150" ,"isActive" : true, "type" : "m"],
        
        ["name": "Session #3", "time" : "Saturday: 8:00 PM - 8:15 PM", "remaining" : "150/150" ,"isActive" : false, "type" : "m"],
        ["name": "Session #4", "time" : "Saturday: 8:00 PM - 8:15 PM", "remaining" : "150/150", "isActive" : false,"type" : "m"],
        ["name": "Session #5", "time" : "Sunday: 7:00 PM - 7:15 PM", "remaining" : "90/150", "isActive" : true,"type" : "m"]
       ]
    
    var femaleArray : NSMutableArray =
    [["name": "Session #1", "time" : "Friday: 9:00 PM - 9:20 PM", "remaining" : "80/150", "isActive" : true, "type" : "f"],
     ["name": "Session #2", "time" : "Monday: 9:00 PM - 9:20 PM", "remaining" : "150/150", "isActive" : false,"type" : "f"]]
   
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        
        
        // Navigation Adjusments
        self.headView.TitleLabel.text = "Home"
        
        self.headView.rightButton.isHidden = false
       
        let logoutImage = UIImage(named: "logout-icon")
        headView.leftButton.setImage(logoutImage, for: .normal)
        headView.leftButton.addTarget(self, action: #selector(self.logout), for: .touchUpInside)
        _ = headView.leftButton.imageView?.changeImageColor(color: AppConstants.themeSecondary)
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.isHidden = true

        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if (segmentControll.selectedSegmentIndex == 1) {
            return femaleArray.count
        }

        return maleArray.count
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : VisitorHomeCell  = (tableView.dequeueReusableCell(withIdentifier: "VisitorHomeCell", for: indexPath) as? VisitorHomeCell)!
        
        var dictionary : NSDictionary = self.maleArray[indexPath.row] as! NSDictionary
        if (segmentControll.selectedSegmentIndex == 1) {
             dictionary = self.femaleArray[indexPath.row] as! NSDictionary
        }

        cell.SessionNameLabel.text = dictionary["name"] as? String
        cell.sessionTImings.text = dictionary["time"] as? String
        cell.reamingSlot.text = dictionary["remaining"] as? String
        let isActive = dictionary["isActive"] as? Bool
        
        if isActive == true {

            cell.backgroundColor = UIColor.init(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        }
        else {

            cell.backgroundColor = UIColor.init(red: 240/255, green: 249/255, blue: 249/255, alpha: 1)
        }
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var dictionary : NSDictionary = self.maleArray[indexPath.row] as! NSDictionary
        if (segmentControll.selectedSegmentIndex == 1) {
            dictionary = self.femaleArray[indexPath.row] as! NSDictionary
        }

        let isActive = dictionary["isActive"] as? Bool
        if isActive == true {
//
        }
        else {
            Utility.shared().simpleAlertView(withTitle: "Error", andMessage: "This session is fully booked, please select other session")
            return
        }
        
        
        if self.lastSelection != nil {
            self.tableView.cellForRow(at: self.lastSelection! as IndexPath)?.accessoryType = .none
        }
        
        self.tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        
        self.lastSelection = indexPath as NSIndexPath
        
        self.tableView.deselectRow(at: indexPath, animated: true)
        

    }
    
    @IBAction func move(_ sender: Any) {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc1: QRScreen? = (storyboard.instantiateViewController(withIdentifier: "QRScreen") as? QRScreen)
            self.navigationController?.pushViewController(vc1!, animated: true)

    }
    
    @IBAction func segmentCOntrollChange(_ sender: Any) {
        self.tableView.reloadData()
    }
    

}

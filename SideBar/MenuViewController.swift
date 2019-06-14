//
//  MenuViewController.swift
//  SideBar
//
//  Created by kireeti on 26/04/19.
//  Copyright © 2019 KireetiSoftSolutions. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController{
    var titleArray = NSMutableArray()
    var accountArray = NSMutableArray()
    var withDrawalArray = NSMutableArray()
    var sectionSelected0 = true
    var SectionSelected1 = true
    var SectionSelected2 = true
    var SectionSelected3 = true
    var SectionSelected4 = true
    var SectionSelected5 = true
    
    @IBOutlet var sideViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet var sideBRBTN: UIButton!
    @IBOutlet var menuTableView: UITableView!
    var isSideViewOpen: Bool = false
    @IBOutlet var headerView: UIView!
    @IBOutlet var sideMenuView: UIView!
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sideMenuView.isHidden = true
        menuTableView.backgroundColor = UIColor.groupTableViewBackground
        isSideViewOpen = false
        self.view.layoutIfNeeded()
        
        //titleSection data
        titleDataSect()
        
        
        
        
     
       
    }
    
    func titleDataSect(){
         menuTableView.tableFooterView = UIView()
        titleArray = ["Home","My Account","Withdraw Cash","Top Products","Shop By Category","Compare & Buy","Refer & Earn","What's New","Testimonials","Happy to Help / Customer Care","Install App","Favorites","Order History","Logout"]
        accountArray = ["Wallet", "Setting"]
        withDrawalArray = ["Make a Recharge","Transfer to E-wallet","Transfer To Bank","Convert To GiftCard"]
        
        
      
    }

    @IBAction func sideBarAction(_ sender: UIButton) {

    
       
        sideMenuView.isHidden = false
        
        if !isSideViewOpen{
            isSideViewOpen = true
            UIView.animate(withDuration: 0.5) {
                self.sideMenuView.frame = CGRect.init(x: 0, y: 0, width: self.sideMenuView.frame.size.width, height: self.sideMenuView.frame.size.height)
//                self.sideBRBTN.frame = CGRect.init(x: 332, y: 45, width: self.sideBRBTN.bounds.width, height: self.sideBRBTN.bounds.height)
            }
           self.sideBRBTN.frame = CGRect.init(x: 332, y: 45, width: self.sideBRBTN.bounds.width, height: self.sideBRBTN.bounds.height)
            self.view.layoutIfNeeded()
            
        }else{
           
            isSideViewOpen = false
           
            UIView.animate(withDuration: 0.5) {
                self.sideMenuView.frame = CGRect.init(x: 0, y: 0, width: -self.sideMenuView.frame.size.width, height: self.sideMenuView.frame.size.height)
                
                
            }
            self.sideBRBTN.frame = CGRect.init(x: 17, y: 45, width: self.sideBRBTN.bounds.width, height: self.sideBRBTN.bounds.height)
            self.view.layoutIfNeeded()
        }
    }
   
    
}

extension MenuViewController :UITableViewDelegate,UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.titleArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            if self.sectionSelected0{
                
            }else {
                
                
            }
        }else if section == 1 {
            
            if self.SectionSelected1{
                return accountArray.count
            }else {
                return 0
            }
            
        }else if section == 2 {
            
            if self.SectionSelected2{
                return withDrawalArray.count
            }else {
                return 0
            }
            
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        if indexPath.section == 1{
            cell?.textLabel?.text = (accountArray[indexPath.row] as! String)
            cell?.accessoryType = .disclosureIndicator
        }
        if indexPath.section == 2{
            cell?.textLabel?.text = (withDrawalArray[indexPath.row] as! String)
              cell?.accessoryType = .disclosureIndicator
        }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let viewSection = UIView()
        viewSection.backgroundColor = UIColor.lightGray
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapFunction(sender:)))
        
        viewSection.addGestureRecognizer(tap)
        viewSection.isUserInteractionEnabled = true
        
        viewSection.tag = section
        let bottomLineView = UIView()
        bottomLineView.frame = CGRect(x: 0, y: 0, width: tableView.frame.width, height: 1)
        bottomLineView.backgroundColor = UIColor.white
        let arrowImage = UIImageView(frame: CGRect(x: tableView.frame.width - 40, y: 5, width: 30, height: 30))
        viewSection.addSubview(arrowImage)
        
        
        
        let img = UIImageView()
        img.frame = CGRect.init(x: 5, y: 13, width: 30, height: 30)
        img.image = UIImage.init(named: "share1.png")
        viewSection.addSubview(img)
        
        let headerLabel = UILabel()
        headerLabel.text = self.titleArray[section] as? String
        headerLabel.frame = CGRect(x: 41, y: 12, width: menuTableView.frame.width - 100, height: 30)
        viewSection.addSubview(bottomLineView)
        viewSection.addSubview(headerLabel)
        
        if section == 0 {
            if self.sectionSelected0 {
                
                
            }else{
                
            }
        }
        else if section == 1 {
            if self.SectionSelected1 {
                arrowImage.image = UIImage(imageLiteralResourceName: "downArrow")
            }else{
                arrowImage.image = UIImage(imageLiteralResourceName: "upArrow")
            }
        }
        else if section == 2 {
            if self.SectionSelected2 {
                arrowImage.image = UIImage(imageLiteralResourceName: "downArrow")
            }else{
                arrowImage.image = UIImage(imageLiteralResourceName: "upArrow")
            }
        }else{
            
        }
        
        return viewSection
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    @objc func tapFunction(sender:UITapGestureRecognizer) {
        let tag = sender.view!.tag
        print("tagView :\(tag)")
        if tag == 0 {
            if self.sectionSelected0 {
                // self.sectionSelected0 = false
            }else{
                // self.sectionSelected0 = true
            }
        }else if tag == 1 {
            if self.SectionSelected1 {
                self.SectionSelected1 = false
            }else{
                self.SectionSelected1 = true
            }
        }else if tag == 2 {
            if self.SectionSelected2 {
                self.SectionSelected2 = false
            }else{
                self.SectionSelected2 = true
            }
        }
        self.menuTableView.reloadData()
    }
    
    
    
}





    
    
    

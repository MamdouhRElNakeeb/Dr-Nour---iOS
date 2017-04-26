//
//  SideMenuTableViewController.swift
//  DrNour
//
//  Created by Mamdouh El Nakeeb on 4/25/17.
//  Copyright © 2017 Be4eM. All rights reserved.
//

import UIKit

class SideMenuTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        
        self.navigationItem.titleView = UIImageView.init(image: UIImage(named: "nour-logo-new"))
        
        self.navigationItem.setHidesBackButton(true, animated: false)
        
        self.tableView.tableFooterView = UIView()
        
        let bgView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        bgView.backgroundColor = UIColor.white
        let cloudsIV = UIImageView(image: UIImage(named: "clouds"))
        cloudsIV.frame = CGRect(x: 0, y: self.view.frame.height - 150, width: self.view.frame.width, height: 150)
        bgView.addSubview(cloudsIV)
        
        self.tableView.backgroundView = bgView
        self.tableView.backgroundColor = UIColor.clear
    }
    
    @IBAction func backBtnOnClick(_ sender: AnyObject) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 6
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        var uiview = UIViewController()
        
        switch indexPath.row {
        case 0:
            _ = navigationController?.popViewController(animated: true)
            return
        case 1:
            uiview = storyBoard.instantiateViewController(withIdentifier: "Services") as! Services
            break
        case 2:
            uiview = storyBoard.instantiateViewController(withIdentifier: "Services") as! Services
            break
        case 3:
            uiview = storyBoard.instantiateViewController(withIdentifier: "Services") as! Services
            break
        case 4:
            uiview = storyBoard.instantiateViewController(withIdentifier: "Services") as! Services
            break
        case 5:
            uiview = storyBoard.instantiateViewController(withIdentifier: "ContactUs") as! ContactUs
            break
        default:
            break
        }
        
        
        self.navigationController?.pushViewController(uiview, animated: true)
    }


}

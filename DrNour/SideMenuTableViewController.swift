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
        
        self.tableView.tableFooterView = UIView()
        
        let bgView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        bgView.backgroundColor = UIColor.white
        let cloudsIV = UIImageView(image: UIImage(named: "clouds"))
        cloudsIV.frame = CGRect(x: 0, y: self.view.frame.height - 150, width: self.view.frame.width, height: 150)
        bgView.addSubview(cloudsIV)
        
        self.tableView.backgroundView = bgView
        self.tableView.backgroundColor = UIColor.clear
    }
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 7
    }



}

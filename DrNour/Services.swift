//
//  Services.swift
//  DrNour
//
//  Created by Mamdouh El Nakeeb on 4/26/17.
//  Copyright © 2017 Be4eM. All rights reserved.
//

import UIKit

class Services: UIViewController {

    @IBOutlet weak var orthoBtn: UIView!
    @IBOutlet weak var whitningBtn: UIView!
    @IBOutlet weak var hollyBtn: UIView!
    @IBOutlet weak var implantBtn: UIView!
    @IBOutlet weak var clientsBtn: UIView!
    @IBOutlet weak var fixedBtn: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        self.navigationItem.setHidesBackButton(true, animated: false)
        
        let screenWidth = self.view.frame.size.width
        let screenHeight = self.view.frame.size.height
        
        let viewHeight = self.view.frame.size.height - (self.navigationController?.navigationBar.frame.size.height)! - UIApplication.shared.statusBarFrame.height
        
        let viewY = (self.navigationController?.navigationBar.frame.size.height)! + UIApplication.shared.statusBarFrame.height
        
        orthoBtn.frame = CGRect(x: 0, y: viewY, width: screenWidth/2, height: viewHeight/3)
        
        whitningBtn.frame = CGRect(x: screenWidth / 2, y: viewY, width: screenWidth/2, height: viewHeight/3)
        
        hollyBtn.frame = CGRect(x: 0, y: viewY + viewHeight / 3, width: screenWidth/2, height: viewHeight/3)
        
        implantBtn.frame = CGRect(x: screenWidth / 2, y: viewY + viewHeight / 3, width: screenWidth/2, height: viewHeight/3)
        
        clientsBtn.frame = CGRect(x: 0, y: screenHeight - viewHeight / 3, width: screenWidth/2, height: viewHeight/3)
        
        fixedBtn.frame = CGRect(x: screenWidth / 2, y: screenHeight - viewHeight / 3, width: screenWidth/2, height: viewHeight/3)
        
    }
    
    @IBAction func sideMenuBtnOnCLick(_ sender: AnyObject) {
        _ = navigationController?.popViewController(animated: true)
    }

}

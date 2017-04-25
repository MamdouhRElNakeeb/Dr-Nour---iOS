//
//  ViewController.swift
//  DrNour
//
//  Created by Mamdouh El Nakeeb on 4/13/17.
//  Copyright © 2017 Be4eM. All rights reserved.
//

import UIKit

class Home1: UIViewController {

    @IBOutlet weak var reserveAppointBtn: UIView!
    @IBOutlet weak var servicesBtn: UIView!
    @IBOutlet weak var blogBtn: UIView!
    @IBOutlet weak var galleryBtn: UIView!
    @IBOutlet weak var aboutBtn: UIView!
    @IBOutlet weak var contactBtn: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let screenWidth = self.view.frame.size.width
        let screenHeight = self.view.frame.size.height
        
        let viewHeight = self.view.frame.size.height - (self.navigationController?.navigationBar.frame.size.height)! - UIApplication.shared.statusBarFrame.height
        
        let viewY = (self.navigationController?.navigationBar.frame.size.height)! + UIApplication.shared.statusBarFrame.height
        
        reserveAppointBtn.frame = CGRect(x: 0, y: viewY, width: screenWidth/2, height: viewHeight/3)
        
        servicesBtn.frame = CGRect(x: screenWidth / 2, y: viewY, width: screenWidth/2, height: viewHeight/3)
        
        blogBtn.frame = CGRect(x: 0, y: viewY + viewHeight / 3, width: screenWidth/2, height: viewHeight/3)
        
        galleryBtn.frame = CGRect(x: screenWidth / 2, y: viewY + viewHeight / 3, width: screenWidth/2, height: viewHeight/3)
        
        aboutBtn.frame = CGRect(x: 0, y: screenHeight - viewHeight / 3, width: screenWidth/2, height: viewHeight/3)
        
        contactBtn.frame = CGRect(x: screenWidth / 2, y: screenHeight - viewHeight / 3, width: screenWidth/2, height: viewHeight/3)
        
    }

}

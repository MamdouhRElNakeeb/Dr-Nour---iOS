//
//  Homr.swift
//  DrNour
//
//  Created by Mamdouh El Nakeeb on 4/25/17.
//  Copyright © 2017 Be4eM. All rights reserved.
//

import UIKit

class Home2: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        let logo = UIImageView.init(image: UIImage(named: "nour-logo-new"))

        logo.frame = CGRect(x: self.view.frame.width - (logo.frame.width/2), y: 0, width: logo.frame.width, height: 40)
        logo.layer.masksToBounds = true
        
        self.navigationItem.titleView = UIImageView.init(image: UIImage(named: "nour-logo-new"))
    }


}

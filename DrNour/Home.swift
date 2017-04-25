//
//  Home.swift
//  DrNour
//
//  Created by Mamdouh El Nakeeb on 4/25/17.
//  Copyright © 2017 Be4eM. All rights reserved.
//

import UIKit

class Home: UIViewController {

    @IBOutlet weak var drNourIV: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        
        let logo = UIImageView.init(image: UIImage(named: "nour-logo-new"))
        
        logo.frame = CGRect(x: self.view.frame.width - (logo.frame.width/2), y: 0, width: logo.frame.width, height: 40)
        logo.layer.masksToBounds = true
        
        self.navigationItem.titleView = UIImageView.init(image: UIImage(named: "nour-logo-new"))
        
        let maskPath = UIBezierPath(roundedRect: drNourIV.bounds,byRoundingCorners: .allCorners, cornerRadii: CGSize(width: drNourIV.frame.width / 2, height: drNourIV.frame.width / 2))
        let maskLayer = CAShapeLayer(layer: maskPath)
        maskLayer.frame = drNourIV.bounds
        maskLayer.path = maskPath.cgPath
        drNourIV.layer.mask = maskLayer
        
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: drNourIV.frame.width / 2,y: drNourIV.frame.height / 2), radius: drNourIV.frame.width / 2, startAngle: CGFloat(0), endAngle:CGFloat(M_PI * 2), clockwise: true)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        
        //change the fill color
        shapeLayer.fillColor = UIColor.clear.cgColor
        //you can change the stroke color
        shapeLayer.strokeColor = UIColor.darkGray.cgColor
        //you can change the line width
        shapeLayer.lineWidth = 9.0
        
        drNourIV.layer.addSublayer(shapeLayer)
    }


}

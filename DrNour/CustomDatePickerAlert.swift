//
//  customDatePickerAlert.swift
//  DrNour
//
//  Created by Mamdouh El Nakeeb on 4/28/17.
//  Copyright © 2017 Be4eM. All rights reserved.
//

import UIKit

class CustomDatePickerAlert: UIViewController {

    @IBOutlet weak var bdDatePicker: UIDatePicker!
    var dob: String = ""
    
    var dobDelegate: DoBDelegate? = nil
    
    var transitioner : CAVTransitioner
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.transitioner = CAVTransitioner()
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.modalPresentationStyle = .custom
        self.transitioningDelegate = self.transitioner
    }
    
    convenience init() {
        self.init(nibName:nil, bundle:nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
    @IBAction func doDismiss(_ sender:AnyObject?) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        

        dobDelegate?.setDoB(dob: dateFormatter.string(from: bdDatePicker.date))
        
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }

}

protocol DoBDelegate: class {
    func setDoB(dob: String)
}

//
//  ReserveAppointment.swift
//  DrNour
//
//  Created by Mamdouh El Nakeeb on 4/28/17.
//  Copyright © 2017 Be4eM. All rights reserved.
//

import UIKit
import Alamofire

class ReserveAppointment: UITableViewController, UITextFieldDelegate, DoBDelegate {

    @IBOutlet weak var serviceSelectBtn: UIButton!
    @IBOutlet weak var bdSelectBtn: UIButton!
    @IBOutlet weak var genderSelectBtn: UIButton!
    @IBOutlet weak var patientName: UITextField!
    @IBOutlet weak var patientMail: UITextField!
    @IBOutlet weak var patientMobile: UITextField!
    @IBOutlet weak var patientMsg: UITextField!
    
    let URL_USER_RESERVE = "http://apps.be4em.net/DrNour/appointment.php"
    
    var serviceName: String = ""
    var date: String = ""
    var gender: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.tableView.estimatedRowHeight = 400
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        self.tableView.setNeedsLayout()
        self.tableView.layoutIfNeeded()
        
        patientName.delegate = self
        patientMail.delegate = self
        patientMsg.delegate = self
        patientMobile.delegate = self
        
    }
    
    @IBAction func serviceSelectBtnOnClick(_ sender: AnyObject) {
        serviceSelect()
    }
    
    
    @IBAction func bdSelectBtnOnClick(_ sender: AnyObject) {
        bdSelect()
    }
    
    @IBAction func genderSelectBtnOnClick(_ sender: AnyObject) {
        genderSelect()
    }
    
    func genderSelect(){
        
        //Create the AlertController
        let actionSheetController: UIAlertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        
        
        //Create and add the Cancel action
        let cancelAction: UIAlertAction = UIAlertAction(title: "إلغاء", style: .cancel) { action -> Void in
            //Just dismiss the action sheet
            
        }
        actionSheetController.addAction(cancelAction)
        //Create and add first option action
        let maleAction: UIAlertAction = UIAlertAction(title: "ذكر", style: .default) { action -> Void in
            
            self.genderSelectBtn.setTitle("ذكر", for: .normal)
            self.gender = "ذكر"
        }
        
        actionSheetController.addAction(maleAction)
        
        let femaleAction: UIAlertAction = UIAlertAction(title: "أنثى", style: .default) { action -> Void in
            
            self.genderSelectBtn.setTitle("أنثى", for: .normal)
            self.gender = "أنثى"
            
        }
        actionSheetController.addAction(femaleAction)
        
        let childAction: UIAlertAction = UIAlertAction(title: "طفل", style: .default) { action -> Void in
            
            self.genderSelectBtn.setTitle("طفل", for: .normal)
            self.gender = "طفل"

        }
        actionSheetController.addAction(childAction)
        
        actionSheetController.popoverPresentationController?.sourceView = self.view
        self.present(actionSheetController, animated: true, completion: nil)
        
        
        
    }
    
    func bdSelect(){
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        
        

        let vc = CustomDatePickerAlert()
        vc.view.frame = CGRect(origin: self.view.center, size: CGSize(width: self.view.frame.width - 50, height: vc.view.frame.height))
        vc.dobDelegate = self
        self.present(vc, animated: true)
        
        let dob = dateFormatter.string(from: vc.bdDatePicker.date)
        print(dob)
        
        bdSelectBtn.setTitle(dob, for: .normal)
        
    }
    
    func setDoB(dob: String) {
        
        print(dob + "/*/*/")
        bdSelectBtn.setTitle(dob, for: .normal)
        date = dob
    }
    
    @IBAction func backBtnOnClick(_ sender: AnyObject) {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func reserveBtnOnClick(_ sender: AnyObject) {
        let utils: Utils = Utils()
        
        if !utils.isConnectedToNetwork(){
            let alert = UIAlertController(title: "تنبيه", message: "يوجد مشكلة فى الإتصال بالإنترنت", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "حاول مرة أخرى", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        if (patientName.text?.isEmpty)! {
            let alert = UIAlertController(title: "تنبيه", message: "يرجى إدخال إسم المريض", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "تعديل", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
            
        }
        if (patientMail.text?.isEmpty)!{
            let alert = UIAlertController(title: "تنبيه", message: "يرجى إدخال البريد الإلكترونى", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "تعديل", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        if (patientMobile.text?.isEmpty)! {
            let alert = UIAlertController(title: "تنبيه", message: "يرجى إدخال رقم الهاتف", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "تعديل", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
            
        }
        
        if (patientMsg.text?.isEmpty)!{
            let alert = UIAlertController(title: "تنبيه", message: "يرجى إدخال الرسالة", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "تعديل", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        if serviceName.isEmpty{
            let alert = UIAlertController(title: "تنبيه", message: "يرجى إختيار الخدمة", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "تعديل", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        if date.isEmpty{
            let alert = UIAlertController(title: "تنبيه", message: "يرجى تحديد الميعاد", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "تعديل", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        if gender.isEmpty{
            let alert = UIAlertController(title: "تنبيه", message: "يرجى إختيار النوع", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "تعديل", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        
        //creating parameters for the post request
        let parameters: Parameters=[
            "service":serviceName,
            "name": patientName.text!,
            "date": date,
            "gender": gender,
            "email": patientMail.text!,
            "mobile": patientMobile.text!,
            "message": patientMsg.text!
        ]
        
        //Sending http post request
        Alamofire.request(URL_USER_RESERVE, method: .post, parameters: parameters).responseJSON
            {
                response in
                //printing response
                print(response)
                
                //getting the json value from the server
                if let result = response.result.value {
                    
                    //converting it as NSDictionary
                    let jsonData = result as! NSDictionary
                    let status = jsonData.value(forKey: "error") as! Int
                    
                    if status != 0 {
                        
                        let alert = UIAlertController(title: "تنبيه", message: "خطأ فى الحجز", preferredStyle: UIAlertControllerStyle.alert)
                        alert.addAction(UIAlertAction(title: "حاول مرة أخرى", style: UIAlertActionStyle.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                        return
                        
                    }
                    else {
                        
                        //successfully logged in our user
                        _ = self.navigationController?.popViewController(animated: true)
                    }
                    
                }
        }
    }
    
    func serviceSelect(){
    
        //Create the AlertController
        let actionSheetController: UIAlertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        //Create and add the Cancel action
        let cancelAction: UIAlertAction = UIAlertAction(title: "إلغاء", style: .cancel) { action -> Void in
            //Just dismiss the action sheet
            
        }
        actionSheetController.addAction(cancelAction)
        //Create and add first option action
        let examineAction: UIAlertAction = UIAlertAction(title: "كشف", style: .default) { action -> Void in
            
            self.serviceSelectBtn.setTitle("كشف", for: .normal)
            self.serviceName = "كشف"
            
        }
        
        actionSheetController.addAction(examineAction)
        
        let fixedAction: UIAlertAction = UIAlertAction(title: "تركيبات ثابتة أو متحركة", style: .default) { action -> Void in
            
            self.serviceSelectBtn.setTitle("تركيبات ثابتة أو متحركة", for: .normal)
            self.serviceName = "تركيبات ثابتة أو متحركة"

        }
        actionSheetController.addAction(fixedAction)
        
        let hollyAction: UIAlertAction = UIAlertAction(title: "ابتسامة هوليوود", style: .default) { action -> Void in
            
            self.serviceSelectBtn.setTitle("ابتسامة هوليوود", for: .normal)
            self.serviceName = "ابتسامة هوليوود"

            
        }
        actionSheetController.addAction(hollyAction)
        
        let implantAction: UIAlertAction = UIAlertAction(title: "زراعة الأسنان", style: .default) { action -> Void in
            
            self.serviceSelectBtn.setTitle("زراعة الأسنان", for: .normal)
            self.serviceName = "زراعة الأسنان"

            
        }
        actionSheetController.addAction(implantAction)
        
        let whiteAction: UIAlertAction = UIAlertAction(title: "تبييض الأسنان", style: .default) { action -> Void in
            
            self.serviceSelectBtn.setTitle("تبييض الأسنان", for: .normal)
            self.serviceName = "تبييض الأسنان"

            
            
        }
        actionSheetController.addAction(whiteAction)
        
        let orthoAction: UIAlertAction = UIAlertAction(title: "تقويم الأسنان", style: .default) { action -> Void in
            
            self.serviceSelectBtn.setTitle("تقويم الأسنان", for: .normal)
            self.serviceName = "تقويم الأسنان"

            
        }
        actionSheetController.addAction(orthoAction)
        
        actionSheetController.popoverPresentationController?.sourceView = self.view
        self.present(actionSheetController, animated: true, completion: nil)

    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 14
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    
}

//
//  AboutUs.swift
//  DrNour
//
//  Created by Mamdouh El Nakeeb on 4/26/17.
//  Copyright © 2017 Be4eM. All rights reserved.
//

import UIKit

class AboutUs: UITableViewController {

    let aboutArray: [String] = [ "عن مركز وايتى" ,
                                 "مركز وايتى دينتال من أكبر مراكز تجميل الأسنان في مصر والوطن العربى، تأسس عام ٢٠٠٠ حيث ان المركز قام على فكرة “تجميل الاسنان فورياً دون ألم” .. فبدلا من أن يتردد المريض على عيادة الاسنان أكثر من مرة، يمكنه ان يحصل الان على العلاج اللازم والتجميل الفوري بدون آلام فقط في زيارة واحدة أو زيارتين.",
                                 "عن دكتور نور الدين مصطفى",
                                 "يعد دكتور نور الدين مصطفى من أطباء الأسنان القلائل في مصر الذين تخصصوا في علم تجميل الأسنان بشكل منفرد ،حيث ان هذا التخصص لا يوجد في الجامعات المصرية .. بل يوجد فقط في جامعة نيويورك ،ودكتور نور عضواً بالكونجرس العالمي لزرع الأسنان بجامعة نيويورك.",
                                 "★ خريج كلية طب الفم والأسنان جامعة القاهرة",
                                 "★ تخصص في مجال تجميل الأسنان",
                                 "★ عضو الجمعية الأمريكية لتجميل الأسنان",
                                 "★ عضو الكونجرس العالمي لزرع الأسنان – جامعة نيويورك",
                                 "★ أحد مطورى حشوات الأسنان التجميلية",
                                 "قام بتطوير الحشوات التجميلية للأسنان بشكل يحافظ على سلامة وظيفة ومظهر حشوات الأسنان عبر تأسيسه لمركز وايتى دينتال ،يهتم دكتور نور الدين بنقل خبرته العلمية إلى مصر من خلال استيراد أحدث أجهزة عمليات تجميل الأسنان من الولايات المتحدة الأمريكية، بالأضافة الى التعاقد مع أكبر معامل صناعة الأسنان بالعالم، بشكل ساهم في إحداث طفرة تجميلية في عالم طب تجميل الأسنان بمصر دكتور نور الدين يتمكن بشكل مشهود له بالنجاح من تطبيق فكرة إجراء تجميل الأسنان الفورى لزائر وايتى دينتال ففي غضون ساعات وربما دقائق معدودة ،يمكنك ان تحصل على ابتسامة هوليودية بأسنان صحية دون الشعور بأى آلام مما يمحى الإعتقاد الراسخ لدى الناس بالربط بين الألام وزيارة عيادات الأسنان."
    ]
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.estimatedRowHeight = 400
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        self.tableView.setNeedsLayout()
        self.tableView.layoutIfNeeded()
        
        self.navigationItem.titleView = UIImageView.init(image: UIImage(named: "nour-logo-new"))
        
        
        self.navigationItem.setHidesBackButton(true, animated: false)
        
        let bgView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        bgView.backgroundColor = UIColor.white
        let cloudsIV = UIImageView(image: UIImage(named: "clouds"))
        cloudsIV.frame = CGRect(x: 0, y: self.view.frame.height - 150, width: self.view.frame.width, height: 150)
        bgView.addSubview(cloudsIV)

        
        self.tableView.backgroundView = bgView
    }

    // MARK: - Table view data source

    @IBAction func backBtnOnClick(_ sender: AnyObject) {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return aboutArray.count + 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "aboutCell", for: indexPath) as! AboutUsTabelViewCell
        
        
        switch indexPath.row {
        case 0:
            cell.cellLabel.text = " \n" + aboutArray[0]
            cell.cellLabel.textColor = UIColor.black
            cell.cellLabel.textAlignment = .center
            break
            
        case 1:
            cell.cellLabel.text = " "
            cell.cellLabel.font = UIFont(name: cell.cellLabel.font.fontName, size: 12)
            break
        case 2:
            cell.cellLabel.text = aboutArray[1]
            cell.cellLabel.textColor = UIColor.darkGray
            break
        case 3:
            cell.cellLabel.text = " \n "
            break
            
        case 4:
            cell.cellLabel.text = aboutArray[2]
            cell.cellLabel.textColor = UIColor.black
            cell.cellLabel.textAlignment = .center

            break
        case 5:
            cell.cellLabel.text = " "
            cell.cellLabel.font = UIFont(name: cell.cellLabel.font.fontName, size: 12)
            
            break
        case 6:
            cell.cellLabel.text = aboutArray[3]
            break
        case 7:
            cell.cellLabel.text = " "
            break
        case 8:
            cell.cellLabel.text = aboutArray[4] + "\n"
            cell.cellLabel.font = UIFont(name: cell.cellLabel.font.fontName, size: 15)
            break
        case 9:
            cell.cellLabel.text = aboutArray[5] + "\n"
            cell.cellLabel.font = UIFont(name: cell.cellLabel.font.fontName, size: 15)
            break
        case 10:
            cell.cellLabel.text = aboutArray[6] + "\n"
            cell.cellLabel.font = UIFont(name: cell.cellLabel.font.fontName, size: 15)
            break
        case 11:
            cell.cellLabel.text = aboutArray[7] + "\n"
            cell.cellLabel.font = UIFont(name: cell.cellLabel.font.fontName, size: 15)
            break
        case 12:
            cell.cellLabel.text = aboutArray[8] + "\n"
            cell.cellLabel.font = UIFont(name: cell.cellLabel.font.fontName, size: 15)
            break
        case 13:
            cell.cellLabel.text = " "
            break
        case 14:
            cell.cellLabel.text = aboutArray[9]
            break
        default:
            break
        }
        
        /*
        let stringValue = cell.cellLabel.text!
        let attrString = NSMutableAttributedString(string: stringValue)
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 24 // change line spacing between paragraph like 36 or 48
        style.minimumLineHeight = 20 // change line spacing between each line like 30 or 40
        
        attrString.addAttribute(NSParagraphStyleAttributeName, value: style, range: NSRange(location: 0, length: stringValue.characters.count))
        cell.cellLabel.attributedText = attrString
        
        */
        return cell
    }


}

//
//  ServiceDetails.swift
//  DrNour
//
//  Created by Mamdouh El Nakeeb on 4/28/17.
//  Copyright © 2017 Be4eM. All rights reserved.
//

import UIKit
import SDWebImage

class ServiceDetails: UITableViewController {

    var serviceItem: ServicesItem = ServicesItem()
    
    @IBOutlet weak var serviceImage: UIImageView!
    @IBOutlet weak var serviceName: UILabel!
    @IBOutlet weak var serviceDescription: UILabel!
    @IBOutlet weak var serviceAdvantages: UILabel!
    @IBOutlet weak var videoWebView: UIWebView!
    @IBOutlet weak var serviceAdvantageHeaer: UILabel!
    

    var youtubeEmbed: String = "https://www.youtube.com/embed/"
    var imageUrl: String = "http://apps.be4em.net/DrNour/gallery/services/"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.estimatedRowHeight = 400
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        self.tableView.setNeedsLayout()
        self.tableView.layoutIfNeeded()
        
        self.navigationItem.titleView = UIImageView.init(image: UIImage(named: "nour-logo-new"))
        
        
        videoWebView.loadRequest(URLRequest(url: URL(string:youtubeEmbed + serviceItem.videoUrl)!))
        serviceImage.sd_setImage(with: URL(string: imageUrl + serviceItem.imageUrl))
        
        serviceName.text = serviceItem.name
        serviceDescription.attributedText = setText(text: serviceItem.description, CharacterSpacing: 0, lineSpacing: 2.5)
        serviceAdvantages.attributedText = setText(text: serviceItem.advantages, CharacterSpacing: 0, lineSpacing: 2.5)
        
    }
    
    func setText(text:String, CharacterSpacing:CGFloat, lineSpacing: CGFloat) ->  NSAttributedString{
        let myParagraphStyle = NSMutableParagraphStyle()
        myParagraphStyle.lineSpacing = lineSpacing
        myParagraphStyle.alignment = .right
        let myAttributes:Dictionary = [
            NSParagraphStyleAttributeName: myParagraphStyle,
            NSKernAttributeName: CharacterSpacing
        ] as [String : Any]
        return NSAttributedString(string: text, attributes: myAttributes)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 6
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerText = UILabel()
        headerText.textColor = UIColor.lightGray
        headerText.adjustsFontSizeToFitWidth = true
        switch section{
    
        case 2:
            headerText.textAlignment = .center
            headerText.text = " مميزات " + serviceItem.name
            headerText.textColor = UIColor.black
            break
        case 3:
            headerText.textAlignment = .center
            headerText.text = "فيديو"
            headerText.textColor = UIColor.black
            break
        default:
            break;
        }
        
        headerText.textColor = UIColor.black
        headerText.font = UIFont(name: serviceName.font.fontName, size: 15)
        
        return headerText
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.row {
        case 0:
            return 200
        case 5:
            return 200
        default:
            return UITableViewAutomaticDimension
        }
        
    }
    
}

//
//  ContactUs.swift
//  DrNour
//
//  Created by Mamdouh El Nakeeb on 4/26/17.
//  Copyright © 2017 Be4eM. All rights reserved.
//

import UIKit
import GoogleMaps


class ContactUs: UITableViewController {

    
    @IBOutlet weak var mapUIView: GMSMapView!
    @IBOutlet weak var addressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        let camera = GMSCameraPosition.camera(withLatitude: 30.0695274, longitude: 31.2854649, zoom: 18.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.settings.compassButton = true
        mapView.settings.scrollGestures = true
        mapView.settings.zoomGestures = true
        
        mapUIView.camera = camera
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 30.0695274, longitude: 31.2854649)
        marker.title = "دكتور نور"
        marker.map = mapUIView
        
    }

    @IBAction func backBtnOnClick(_ sender: AnyObject) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerText = UILabel()
        headerText.textColor = UIColor.lightGray
        headerText.adjustsFontSizeToFitWidth = true
        switch section{
        case 0:
            headerText.textAlignment = .center
            headerText.text = "الموقع"
            headerText.font = UIFont(name: addressLabel.font.fontName, size: 17)
            break
        case 1:
            headerText.textAlignment = .center
            headerText.text = "معلومات التواصل"
            headerText.font = UIFont(name: addressLabel.font.fontName, size: 17)
            break
        case 2:
            headerText.textAlignment = .center
            headerText.text = "لحجز موعد"
            headerText.font = UIFont(name: addressLabel.font.fontName, size: 17)
            break
        default:
            break;
        }
        
        return headerText
    }
    
}

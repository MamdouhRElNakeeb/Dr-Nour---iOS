//
//  ServicesCV.swift
//  DrNour
//
//  Created by Mamdouh El Nakeeb on 4/28/17.
//  Copyright © 2017 Be4eM. All rights reserved.
//

import UIKit
import Alamofire

private let reuseIdentifier = "serviceCell"

class ServicesCV: UICollectionViewController {
    
    @IBOutlet var servicesCV: UICollectionView!
    
    let servicesUrl =  "http://apps.be4em.net/DrNour/services.php"
    let galleryUrl =  "http://apps.be4em.net/DrNour/gallery/services/"
    var servicesData: Array<ServicesItem> = Array<ServicesItem>()

    var cellFrame: CGSize = CGSize()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Do any additional setup after loading the view.
        
        let cellSize = CGSize(width: self.view.frame.width / 2, height: self.view.frame.width / 2)
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = cellSize
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        servicesCV.setCollectionViewLayout(layout, animated: true)
        
        
        loadServices()
        
        
        self.navigationItem.setHidesBackButton(true, animated: false)
    }

    func loadServices(){
        
        let utils: Utils = Utils()
        
        if !utils.isConnectedToNetwork(){
            let alert = UIAlertController(title: "تنبيه", message: "يوجد مشكلة فى الإتصال بالإنترنت", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "حاول مرة أخرى", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        Alamofire.request(servicesUrl)
            .responseJSON{
                
                response in
                
                print(response)
                
                if let result = response.result.value {
                    
                    let servicesArray = result as! NSArray
                    
                    for service in servicesArray {
                        
                        
                        self.servicesData.append(ServicesItem.init(name: (service as AnyObject).value(forKey: "title") as! String, description: (service as AnyObject).value(forKey: "content") as! String, advantages: (service as AnyObject).value(forKey: "advantages") as! String, imageUrl: (service as AnyObject).value(forKey: "image") as! String, videoUrl: (service as AnyObject).value(forKey: "video") as! String))
                        
                    }
                    
                }
                
                self.servicesCV.reloadData()
        }
    }
    
    @IBAction func backBtnOnClick(_ sender: AnyObject) {
        _ = self.navigationController?.popViewController(animated: true)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return servicesData.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "serviceCell", for: indexPath) as! ServiceCollectionCell
    
        // Configure the cell
        cell.serviceIV.sd_setImage(with: URL(string: galleryUrl + servicesData[indexPath.row].imageUrl))
        
        cell.serviceLabel.text = servicesData[indexPath.row].name
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        collectionView.deselectItem(at: indexPath, animated: true)
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let serviceDetails = storyBoard.instantiateViewController(withIdentifier: "serviceDetails") as! ServiceDetails
        
        serviceDetails.serviceItem = servicesData[indexPath.row]
        
        self.navigationController?.pushViewController(serviceDetails, animated: true)
        
    }
    
    
}

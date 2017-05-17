//
//  Gallery.swift
//  DrNour
//
//  Created by Mamdouh El Nakeeb on 4/26/17.
//  Copyright © 2017 Be4eM. All rights reserved.
//

import UIKit
import Alamofire

class Gallery: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var galleryCV: UICollectionView!
    @IBOutlet weak var galleryTitleView: UIView!
    
    let galleryUrl =  "http://apps.be4em.net/DrNour/gallery"
    var galleryData: Array<String> = Array<String>()
    var galleryDescData: Array<String> = Array<String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        loadGallery()
        
        self.navigationItem.setHidesBackButton(true, animated: false)
        
        let bgView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        bgView.backgroundColor = UIColor.white
        let cloudsIV = UIImageView(image: UIImage(named: "clouds"))
        cloudsIV.frame = CGRect(x: 0, y: self.view.frame.height - 150, width: self.view.frame.width, height: 150)
        bgView.addSubview(cloudsIV)

        self.view.addSubview(cloudsIV)
        
        
        let maskPath = UIBezierPath(roundedRect: galleryTitleView.bounds,byRoundingCorners: .allCorners, cornerRadii: CGSize(width: galleryTitleView.frame.width, height: galleryTitleView.frame.height))
        let maskLayer = CAShapeLayer(layer: maskPath)
        maskLayer.frame = galleryTitleView.bounds
        maskLayer.path = maskPath.cgPath
        galleryTitleView.layer.mask = maskLayer
        
        
    }
    
    
    func loadGallery(){
        
        Alamofire.request(galleryUrl + ".php")
            .responseJSON{
        
                response in
                
                print(response)
                
                if let result = response.result.value {
                    
                    let photosArray = result as! NSArray
                    
                    for photoStr in photosArray {
                        
                        
                        self.galleryData.append((photoStr as AnyObject).value(forKey: "name") as! String)
                        
                        self.galleryDescData.append((photoStr as AnyObject).value(forKey: "description") as! String)
                    }
                    
                }
                
                self.galleryCV.reloadData()
        }
    }
    
    @IBAction func backBtnOnClick(_ sender: AnyObject) {
        _ = self.navigationController?.popViewController(animated: true)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GalleryCell", for: indexPath) as! GalleryCollectionCell
        
        cell.galleryCellIV.sd_setImage(with: URL(string: galleryUrl + "/" + galleryData[indexPath.row])!)
        
        cell.galleryCellIV.layer.masksToBounds = true
        
        cell.galleryCellLabel.text = galleryDescData[indexPath.row]
        
        print(galleryUrl + "/" + galleryData[indexPath.row])
        
        return cell
    }
 
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return galleryData.count
    }
    
}

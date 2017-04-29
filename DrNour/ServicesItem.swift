//
//  ServicesItem.swift
//  DrNour
//
//  Created by Mamdouh El Nakeeb on 4/28/17.
//  Copyright © 2017 Be4eM. All rights reserved.
//

import Foundation

class ServicesItem {
    
    var name: String = ""
    var description: String = ""
    var advantages: String = ""
    var imageUrl: String = ""
    var videoUrl: String = ""
    
    init(name: String, description: String, advantages: String, imageUrl: String, videoUrl: String) {
        self.name = name
        self.description = description
        self.advantages = advantages
        self.imageUrl = imageUrl
        self.videoUrl = videoUrl
    }
    
    init() {
        
    }
    
}

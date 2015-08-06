//
//  SocialItem.swift
//  ZoomingIcons
//
//  Created by Auston Salvana on 8/6/15.
//  Copyright (c) 2015 ASolo. All rights reserved.
//

import UIKit

class SocialItem: NSObject {
    
    // 4 properties: an image, a colour, a name (String), and a summary (String)
    var image: UIImage?
    var color: UIColor?
    var name: String?
    var summary: String?
    
    init(image: UIImage, color: UIColor, name: String, summary: String) {
        super.init()
        self.image = image
        self.color = color
        self.name = name
        self.summary = summary
    }
}

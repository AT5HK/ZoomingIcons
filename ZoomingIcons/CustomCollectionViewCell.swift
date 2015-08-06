//
//  CustomCollectionViewCell.swift
//  ZoomingIcons
//
//  Created by Auston Salvana on 8/6/15.
//  Copyright (c) 2015 ASolo. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var viewColor: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    override func layoutSubviews() {
        viewColor.layer.cornerRadius = viewColor.frame.width/2
        viewColor.layer.masksToBounds = true
    }
    
}

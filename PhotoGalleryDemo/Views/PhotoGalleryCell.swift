//
//  PhotoGalleryCell.swift
//  PhotoGalleryDemo
//
//  Created by Eiji Kushida on 2018/02/04.
//  Copyright © 2018年 Eiji Kushida. All rights reserved.
//

import UIKit

final class PhotoGalleryCell: UICollectionViewCell {
    
    @IBOutlet weak private var photoImageView: UIImageView!
    
    var photoGallery: PhotoGallery? {
        didSet {
            self.setup()
        }
    }
    
    private func setup() {
        if let photoGallery = photoGallery {
            photoImageView.image = photoGallery.photoImage
        } else {
            photoImageView.image = nil
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 3.0
        layer.shadowRadius = 10
        layer.shadowOpacity = 0.4
        layer.shadowOffset = CGSize(width: 5, height: 10)
        
        self.clipsToBounds = false
    }    
}

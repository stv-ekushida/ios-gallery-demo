//
//  PhotoGallery.swift
//  PhotoGalleryDemo
//
//  Created by Eiji Kushida on 2018/02/04.
//  Copyright © 2018年 Eiji Kushida. All rights reserved.
//

import UIKit

final class PhotoGallery {

    var photoImage: UIImage?
    
    init(photoImage: UIImage) {
        self.photoImage = photoImage
    }
    
    static func fetchInterests() -> [PhotoGallery] {
        return [
            PhotoGallery(photoImage: UIImage(named: "f1")! ),
            PhotoGallery(photoImage: UIImage(named: "f2")! ),
            PhotoGallery(photoImage: UIImage(named: "f3")! ),
            PhotoGallery(photoImage: UIImage(named: "f4")! ),
        ]
    }
}

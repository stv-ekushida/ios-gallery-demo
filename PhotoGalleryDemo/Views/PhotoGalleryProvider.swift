//
//  PhotoGalleryProvider.swift
//  PhotoGalleryDemo
//
//  Created by Eiji Kushida on 2018/02/04.
//  Copyright © 2018年 Eiji Kushida. All rights reserved.
//

import UIKit

final class PhotoGalleryProvider: NSObject, UICollectionViewDataSource {
    
    var photoGallerys: [PhotoGallery] = []
    
    init(photoGallerys: [PhotoGallery]) {
        self.photoGallerys = photoGallerys
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoGallerys.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoGalleryCell",
                                                            for: indexPath) as? PhotoGalleryCell else {
            fatalError("PhotoGalleryCell not found")
        }
        
        cell.photoGallery = photoGallerys[indexPath.item]
        return cell
    }
}

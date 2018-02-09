//
//  PhotoGalleryViewModel.swift
//  PhotoGalleryDemo
//
//  Created by Eiji Kushida on 2018/02/04.
//  Copyright © 2018年 Eiji Kushida. All rights reserved.
//

import UIKit

final class PhotoGalleryViewModel {
    
    private let cellScaling: CGFloat = 0.6
    
    private var screenSize: CGSize {
        return UIScreen.main.bounds.size
    }
    
    var cellWidth: CGFloat {
        return floor(screenSize.width * cellScaling)
    }
    
    var cellHeight: CGFloat {
        return floor(screenSize.height * cellScaling)
    }
}

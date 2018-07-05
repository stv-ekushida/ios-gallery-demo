//
//  ViewController.swift
//  PhotoGalleryDemo
//
//  Created by Eiji Kushida on 2018/02/04.
//  Copyright © 2018年 Eiji Kushida. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet weak private var collectionView: UICollectionView!
    
    // MARK: - Properties
    private var viewModel = PhotoGalleryViewModel()
    private var provider = PhotoGalleryProvider(photoGallerys: PhotoGallery.fetchInterests())
    private var insetX: CGFloat {
        return (view.bounds.width - viewModel.cellWidth) / 2.0
    }
    private var insetY: CGFloat {
        return (view.bounds.height - viewModel.cellHeight) / 2.0
    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        collectionView.contentInsetAdjustmentBehavior = .automatic
        guard let layout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout else {
            return
        }
        layout.itemSize = CGSize(width: viewModel.cellWidth, height: viewModel.cellHeight)
        collectionView?.contentInset = UIEdgeInsets(top: insetX, left: insetX, bottom: insetY, right: insetX)

        collectionView?.dataSource = provider
        collectionView?.delegate = self
    }
}

// MARK: - <#UIScrollViewDelegate, UICollectionViewDelegate#>
extension ViewController : UIScrollViewDelegate, UICollectionViewDelegate {
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView,
                                   withVelocity velocity: CGPoint,
                                   targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        guard let layout = self.collectionView?.collectionViewLayout as? UICollectionViewFlowLayout else {
            fatalError("layout not found")
        }
        let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
        
        var offset = targetContentOffset.pointee
        let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludingSpacing
        let roundedIndex = round(index)
        
        offset = CGPoint(x: roundedIndex * cellWidthIncludingSpacing - scrollView.contentInset.left,
                         y: -scrollView.contentInset.top)
        targetContentOffset.pointee = offset
    }
}

//
//  ViewController.swift
//  test
//
//  Created by XOXODAYADMIN on 26/03/19.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit

class PhotoListVC: UIViewController {
    @IBOutlet weak var PhotoListCollectionView: UICollectionView!
    var SubAlbumPhotoList   :   [PhotoListDictModel]    =   []
    fileprivate let interactor              =   InteractorForVC()
    var albumTitleStr = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = albumTitleStr
        self.PhotoListCollectionView.delegate = self
        self.PhotoListCollectionView.dataSource = self
        self.PhotoListCollectionView.reloadData()
    }


}


extension PhotoListVC : UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return SubAlbumPhotoList.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoListCVCell", for: indexPath) as? PhotoListCVCell else { fatalError("Cell not exists in storyboard")}
        
        let modelObj    =   self.SubAlbumPhotoList[indexPath.row]

        if modelObj.photo_thumbnailUrl != "" {
            let url1 = URL(string: "\(modelObj.photo_thumbnailUrl)")!
            cell.imgView.sd_setImage(with: url1, placeholderImage: UIImage.init(named: "placeholder-image"))
        }

        return cell
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        var imagesArray : [String] = []
        var namesArray : [String] = []

        for item1 in self.SubAlbumPhotoList {
            imagesArray.append(item1.photo_url)
            namesArray.append(item1.photo_title)

        }
        let slideShowVC = PhotoDetailVC(pictures: imagesArray, photosTitles:namesArray)
        slideShowVC.transitioningDelegate   =   self
       // slideShowVC.interactor  =   interactor
        slideShowVC.selectedIndex = (indexPath.row)
       // slideShowVC.title =
        self.navigationController?.pushViewController(slideShowVC, animated: true)

    }
    
}

extension PhotoListVC : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellSize = collectionView.frame.width/3.1
        return CGSize(width: cellSize, height: cellSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    
}
//MARK: Extension for imageViewer
extension PhotoListVC :   UIViewControllerTransitioningDelegate {
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return DissmissAnimator()
    }
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactor.hasStarted ? interactor : nil
    }
}
